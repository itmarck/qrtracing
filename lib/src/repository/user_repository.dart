import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_token.dart';
import 'local_data_source.dart';
import 'unique_id.dart';

abstract class IUserRepository {
  Future<void> registerTest(String mode, bool positive);
  Future<void> registerUser();
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
        'date': DateTime.now().millisecondsSinceEpoch,
        'method': mode,
        'positive': positive,
      }
    }, merge: true);
  }

  @override
  Future<void> registerUser() async {
    await _registerUserInFirestore();
    await _markFirstAccess();
  }

  @override
  Future<void> deleteUser() async {
    await _dataSource.removeFirstAccess();
  }

  Future<void> _registerUserInFirestore() async {
    var uniqueId = await _uniqueId.value();
    var token = await _token.value();
    if (uniqueId == null || token == null) return;

    var users = _firestore.collection('users');
    await users.document(uniqueId).setData({
      'id': uniqueId,
      'token': token,
    }, merge: true);
  }

  Future<void> _markFirstAccess() async {
    await _dataSource.setFirstAccess();
  }
}
