import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  bool _initialized = false;

  Future<void> init(BuildContext context) async {
    if (!_initialized) {
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure(
        onLaunch: (Map<String, dynamic> message) async {
          print('onLaunch: $message');
        },
        onResume: (Map<String, dynamic> message) async {
          print('onResume: $message');
        },
        onMessage: (Map<String, dynamic> message) async {
          print('onMessage: $message');
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: ListTile(
                title: Text(message['notification']['title']),
                subtitle: Text(message['notification']['body']),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        },
      );

      _initialized = true;
    }
  }

  Future<String> getToken() async {
    return await _firebaseMessaging.getToken();
  }
}
