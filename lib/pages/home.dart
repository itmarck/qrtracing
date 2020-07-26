import 'package:flutter/material.dart';

import '../widgets/history.dart';
import '../widgets/register_test.dart';
import '../widgets/scanner.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverScanner(
              onScan: (result) => print('Data: $result'),
            ),
            SliverRegisterTest(),
            SliverListHistory(),
          ],
        ),
      ),
    );
  }
}