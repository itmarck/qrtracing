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

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return Container(
      color: Theme.of(context).canvasColor,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RaisedButton(
          onPressed: () {},
          colorBrightness: Brightness.dark,
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
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
