import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    this.label,
    this.onPressed,
  });

  final String label;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      colorBrightness: Brightness.dark,
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      color: Theme.of(context).primaryColor,
      elevation: 0,
      highlightElevation: 0,
      padding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    );
  }
}
