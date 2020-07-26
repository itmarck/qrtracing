import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseToken {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String _value;

  String get value => _value;

  FirebaseToken() {
    init();
  }

  void init() async {
    if (Platform.isIOS) {
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure();
    }

    _value = await _firebaseMessaging.getToken();
    print(_value);
  }
}
