import 'package:flutter/material.dart';

import 'select.dart';

class FormBottomSheet extends StatelessWidget {
  FormBottomSheet({this.onPressed});

  final GestureTapCallback onPressed;
  final String label = 'REGISTRAR';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                Select(
                  label: 'Modalidad',
                  options: {
                    1: 'Prueba rápida',
                    2: 'Prueba Molecular',
                  },
                ),
                Select(
                  label: 'Resultado',
                  options: {
                    1: 'Positivo',
                    2: 'Negativo',
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
