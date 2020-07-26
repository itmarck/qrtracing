import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/provider/user.dart';
import '../widgets/button.dart';
import 'home.dart';

class PolicyPage extends StatelessWidget {
  static final String routeName = '/policy';

  final String buttonLabel = 'ACEPTO';
  final String titlePage = 'Bienvenido';
  final String description = 'Descripción de las politicas de privacidad';

  void onPressed(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).registerUser();
    Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }

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
                onPressed: () => onPressed(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
