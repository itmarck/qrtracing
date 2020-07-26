import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  Select({
    @required this.label,
    @required this.options,
  });

  final String label;
  final Map<int, String> options;

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  int value;

  void onTapButton(int key) {
    value = key;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        Row(
          children: widget.options.entries
              .map(
                (entry) => GestureDetector(
                  onTap: () => onTapButton(entry.key),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .primaryColor
                          .withAlpha(value == entry.key ? 64 : 16),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text('${entry.value}'),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
