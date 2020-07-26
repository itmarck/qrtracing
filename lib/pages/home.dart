import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../push_notifications.dart';
import '../src/domain/place.dart';
import '../src/provider/user.dart';
import '../widgets/history.dart';
import '../widgets/register_test.dart';
import '../widgets/scanner.dart';

class HomePage extends StatefulWidget {
  static final String routeName = '/home';

  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    PushNotificationsManager().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverScanner(
              onScan: (Place place) {
                Provider.of<UserProvider>(context, listen: false)
                    .saveRecord(place);
                Future.delayed(Duration(milliseconds: 1500), () {
                  setState(() {});
                });
              },
            ),
            SliverRegisterTest(),
            SliverListHistory(),
          ],
        ),
      ),
    );
  }
}
