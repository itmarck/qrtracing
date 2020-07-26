import 'package:flutter/material.dart';
import 'package:qrtracing/src/repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  final IUserRepository _repository = UserRepository();

  void registerTest(String mode, bool positive) async {
    await _repository.registerTest(mode, positive);
  }

  void registerUser() async {
    await _repository.registerUser();
  }

  void deleteUser() async {
    await _repository.deleteUser();
  }
}
