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
  Future<void> registerTest(String mode, bool positive) async {}

  @override
  Future<void> registerUser() async {
    await registerUserInFirestore();
    await markFirstAccess();
  }

  @override
  Future<void> deleteUser() async {
    await _dataSource.removeFirstAccess();
  }

  Future<void> registerUserInFirestore() async {
    if (_uniqueId.value == null || _token.value == null) return;

    var users = _firestore.collection('users');
    await users.document(_uniqueId.value).setData({
      'id': _uniqueId.value,
      'token': _token.value,
    });
  }

  Future<void> markFirstAccess() async {
    await _dataSource.setFirstAccess();
  }
}
