import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrtracing/src/provider/user.dart';
import 'package:qrtracing/widgets/button.dart';

import 'form_bottom_sheet.dart';

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

  void register(BuildContext context, String mode, bool positive) {
    Provider.of<UserProvider>(context, listen: false)
        .registerTest(mode, positive);
  }

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return Container(
      color: Theme.of(context).canvasColor,
      height: 80,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Button(
            label: label,
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Theme.of(context).canvasColor,
                context: context,
                builder: (context) => Wrap(
                  children: <Widget>[
                    FormBottomSheet(
                      onPressed: (mode, positive) =>
                          register(context, mode, positive),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
