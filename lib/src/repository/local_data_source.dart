import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalDataSource {
  Future<bool> firstAccess();
  Future<String> getUniqueId();
  Future<void> setUniqueId(String uniqueId);
  Future<void> removeUniqueId();
}

class LocalDataSource implements ILocalDataSource {
  final String _key = 'uniqueId';

  LocalDataSource();

  @override
  Future<bool> firstAccess() async {
    var _storage = await SharedPreferences.getInstance();
    var value = await _storage.getString(_key);
    return value == null;
  }

  @override
  Future<String> getUniqueId() async {
    var _storage = await SharedPreferences.getInstance();
    return await _storage.getString(_key);
  }

  @override
  Future<void> setUniqueId(String uniqueId) async {
    var _storage = await SharedPreferences.getInstance();
    await _storage.setString(_key, uniqueId);
  }

  @override
  Future<void> removeUniqueId() async {
    var _storage = await SharedPreferences.getInstance();
    await _storage.remove(_key);
  }
}
