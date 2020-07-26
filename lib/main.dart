import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrtracing/pages/policy.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  final String appTitle = 'QRTracing';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      initialRoute: PolicyPage.routeName,
      onGenerateRoute: (settings) {
        Widget page = HomePage();

        if (settings.name == PolicyPage.routeName) {
          page = PolicyPage();
        }

        return MaterialPageRoute(
          builder: (context) {
            return page;
          },
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
