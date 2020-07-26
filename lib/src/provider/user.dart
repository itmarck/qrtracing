import 'package:flutter/material.dart';
import 'package:qrtracing/src/repository/local_data_source.dart';

import '../domain/place.dart';
import '../domain/record.dart';
import '../repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  final IUserRepository _repository = UserRepository();

  String uniqueId;

  UserProvider({this.uniqueId}) {
    init();
  }

  void init() async {
    uniqueId = await LocalDataSource().getUniqueId();
  }

  void registerTest(String mode, bool positive) async {
    await _repository.registerTest(mode, positive);
  }

  void registerUser() async {
    await _repository.registerUser(onRegister: (String id) {
      uniqueId = id;
      notifyListeners();
    });
  }

  void saveRecord(Place place) async {
    await _repository.saveRecord(place);
  }

  Stream<List<Record>> getHistory() {
    return _repository.getHistory(uniqueId);
  }

  void deleteUser() async {
    await _repository.deleteUser();
  }
}
