import 'package:flutter/material.dart';

class SliverRegisterTest extends StatelessWidget {
  const SliverRegisterTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: RegisterTestHeader(),
      pinned: true,
      floating: true,
    );
  }
}

class RegisterTestHeader extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(oldDelegate) => true;

  final String label = 'REGISTRA TU TEST';

  void register() {}

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return Container(
      color: Theme.of(context).canvasColor,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RaisedButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Theme.of(context).canvasColor,
              context: context,
              builder: (context) => Wrap(
                children: <Widget>[_FormBottomSheet(onPressed: register)],
              ),
            );
          },
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
        ),
      ),
    );
  }
}

class _FormBottomSheet extends StatelessWidget {
  _FormBottomSheet({this.onPressed});

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
                _SelectForm(
                  label: 'Modalidad',
                  options: {
                    1: 'Prueba rápida',
                    2: 'Prueba Molecular',
                  },
                ),
                _SelectForm(
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

class _SelectForm extends StatefulWidget {
  _SelectForm({
    @required this.label,
    @required this.options,
  });

  final String label;
  final Map<int, String> options;

  @override
  _SelectFormState createState() => _SelectFormState();
}

class _SelectFormState extends State<_SelectForm> {
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
