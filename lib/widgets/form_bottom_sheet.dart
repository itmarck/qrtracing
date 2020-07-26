import 'package:flutter/material.dart';

import 'select.dart';

class FormBottomSheet extends StatefulWidget {
  FormBottomSheet({this.onPressed});

  final void Function(String mode, bool positive) onPressed;

  @override
  _FormBottomSheetState createState() => _FormBottomSheetState();
}

class _FormBottomSheetState extends State<FormBottomSheet> {
  final String label = 'REGISTRAR';
  final String testType1 = 'Prueba rápida';
  final String testType2 = 'Prueba molecular';

  String mode;
  bool positive;

  bool get isDisabled => mode == null || positive == null;

  void onPressed() {
    if (isDisabled) return;

    widget.onPressed(mode, positive);
    Navigator.pop(context);
  }

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
                  options: {0: testType1, 1: testType2},
                  onSelect: (String value) {
                    mode = value;
                    setState(() {});
                  },
                ),
                Select(
                  label: 'Resultado',
                  options: {0: 'Positivo', 1: 'Negativo'},
                  onSelect: (String value) {
                    positive = value == 'Positivo';
                    setState(() {});
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
              color: isDisabled ? Colors.grey : Theme.of(context).primaryColor,
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
