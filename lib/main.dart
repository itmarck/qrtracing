import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';
import 'pages/policy.dart';
import 'src/provider/user.dart';
import 'src/repository/local_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firstAccess = await LocalDataSource().firstAccess();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        initialRoute: firstAccess ? PolicyPage.routeName : HomePage.routeName,
        routes: {
          HomePage.routeName: (_) => HomePage(),
          PolicyPage.routeName: (_) => PolicyPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
