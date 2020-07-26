import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalDataSource {
  Future<bool> getFirstAccess();
  Future<void> setFirstAccess();
  Future<void> removeFirstAccess();
}

class LocalDataSource implements ILocalDataSource {
  final String _key = 'firstAccess';

  LocalDataSource();

  @override
  Future<bool> getFirstAccess() async {
    var _storage = await SharedPreferences.getInstance();
    var value = await _storage.getBool(_key);
    return value ?? true;
  }

  @override
  Future<void> setFirstAccess() async {
    var _storage = await SharedPreferences.getInstance();
    await _storage.setBool(_key, false);
  }

  @override
  Future<void> removeFirstAccess() async {
    var _storage = await SharedPreferences.getInstance();
    await _storage.remove(_key);
  }
}
