import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/place.dart';
import '../domain/record.dart';
import 'firebase_token.dart';
import 'local_data_source.dart';
import 'unique_id.dart';

abstract class IUserRepository {
  Future<void> registerTest(String mode, bool positive);
  Future<void> registerUser({void Function(String id) onRegister});
  Future<void> saveRecord(Place place);
  Stream<List<Record>> getHistory(String uniqueId);
  Future<void> deleteUser();
}

class UserRepository implements IUserRepository {
  final Firestore _firestore = Firestore.instance;
  final FirebaseToken _token = FirebaseToken();
  final UniqueId _uniqueId = UniqueId();
  final LocalDataSource _dataSource = LocalDataSource();

  @override
  Future<void> registerTest(String mode, bool positive) async {
    var uniqueId = await _uniqueId.value();
    if (uniqueId == null) return;

    var users = _firestore.collection('users');
    await users.document(uniqueId).setData({
      'test': {
        'date': FieldValue.serverTimestamp(),
        'method': mode,
        'positive': positive,
      }
    }, merge: true);
  }

  @override
  Future<void> registerUser({
    void Function(String id) onRegister,
  }) async {
    await _registerUserInFirestore(onRegister: onRegister);
    await _markFirstAccess();
  }

  @override
  Future<void> saveRecord(Place place) async {
    var uniqueId = await _uniqueId.value();
    var token = await _token.value();

    var records = _firestore.collection('records');
    await records.add({
      'user': uniqueId,
      'placeId': place.id,
      'place': place.name,
      'companyId': place.company.id,
      'company': place.company.name,
      'date': FieldValue.serverTimestamp(),
      'token': token,
    });
  }

  @override
  Stream<List<Record>> getHistory(String uniqueId) {
    var users = _firestore.collection('users');
    var user = users.document(uniqueId);
    var snapshots = user
        .collection('history')
        .orderBy('checkIn', descending: true)
        .snapshots();
    var stream = snapshots.map(
      (snapshot) => snapshot.documents.map((document) {
        print(document.data);
        return Record.fromJson(document.data);
      }).toList(),
    );
    return stream;
  }

  @override
  Future<void> deleteUser() async {
    await _dataSource.removeUniqueId();
  }

  Future<void> _registerUserInFirestore({
    void Function(String id) onRegister,
  }) async {
    var uniqueId = await _uniqueId.value();
    var token = await _token.value();
    if (uniqueId == null || token == null) return;

    var users = _firestore.collection('users');
    await users.document(uniqueId).setData({
      'id': uniqueId,
      'token': token,
    }, merge: true);

    onRegister(uniqueId);
  }

  Future<void> _markFirstAccess() async {
    var uniqueId = await _uniqueId.value();
    await _dataSource.setUniqueId(uniqueId);
  }
}
