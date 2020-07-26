import 'package:flutter/material.dart';
import 'package:qrtracing/pages/home.dart';
import 'package:qrtracing/widgets/button.dart';

class PolicyPage extends StatelessWidget {
  static final String routeName = '/policy';

  final String buttonLabel = 'ACEPTO';
  final String titlePage = 'Bienvenido';
  final String description = 'Descripción de las politicas de privacidad y eso';

  void goHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }

  void registerUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      titlePage,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(description),
                  ],
                ),
              ),
              Button(
                label: buttonLabel,
                onPressed: () {
                  registerUser();
                  goHome(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
