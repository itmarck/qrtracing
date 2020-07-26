import 'dart:io';

import 'package:device_info/device_info.dart';

class UniqueId {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  String _uniqueId;

  String get value => _uniqueId;

  UniqueId() {
    getUniqueId();
  }

  void getUniqueId() async {
    if (Platform.isAndroid) {
      var androidInfo = await _deviceInfo.androidInfo;
      _uniqueId = androidInfo.androidId;
    } else if (Platform.isIOS) {
      var iosInfo = await _deviceInfo.iosInfo;
      _uniqueId = iosInfo.identifierForVendor;
    }
  }
}
