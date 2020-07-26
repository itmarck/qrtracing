import 'package:flutter/material.dart';

import '../domain/place.dart';
import '../domain/record.dart';
import '../repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  final IUserRepository _repository = UserRepository();

  void registerTest(String mode, bool positive) async {
    await _repository.registerTest(mode, positive);
  }

  void registerUser() async {
    await _repository.registerUser();
  }

  void saveRecord(Place place) async {
    await _repository.saveRecord(place);
  }

  Future<List<Record>> getHistory() async {
    return await _repository.getHistory();
  }

  void deleteUser() async {
    await _repository.deleteUser();
  }
}
