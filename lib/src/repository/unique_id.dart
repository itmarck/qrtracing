import 'dart:io';

import 'package:device_info/device_info.dart';

class UniqueId {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  UniqueId();

  Future<String> value() async {
    if (Platform.isAndroid) {
      var androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.androidId;
    } else if (Platform.isIOS) {
      var iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    return null;
  }
}
