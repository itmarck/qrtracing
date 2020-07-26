import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrtracing/pages/policy.dart';
import 'package:qrtracing/src/repository/local_data_source.dart';

import 'pages/home.dart';

bool appReady = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firstAccess = await LocalDataSource().getFirstAccess();
  runApp(MyApp(firstAccess: firstAccess));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  MyApp({this.firstAccess});

  final String appTitle = 'QRTracing';
  final bool firstAccess;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      initialRoute: firstAccess ? PolicyPage.routeName : HomePage.routeName,
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
