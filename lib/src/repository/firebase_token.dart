import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseToken {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  FirebaseToken();

  Future<String> value() async {
    if (Platform.isIOS) {
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure();
    }

    return await _firebaseMessaging.getToken();
  }
}
