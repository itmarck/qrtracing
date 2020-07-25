import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/history.dart';
import 'widgets/register_test.dart';
import 'widgets/scanner.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRTracing',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

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
