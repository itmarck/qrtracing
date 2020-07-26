import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/policy.dart';
import '../src/domain/record.dart';
import '../src/provider/user.dart';
import 'record.dart';

class SliverListHistory extends StatelessWidget {
  const SliverListHistory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: StreamBuilder<List<Record>>(
              stream: provider.getHistory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var records = snapshot.data;
                  return Column(
                    children: records
                        .map((record) => RecordWidget(record: record))
                        .toList(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Algo salió mal'));
                }

                return LinearProgressIndicator();
              },
            ),
          ),
          DeleteDataButton(),
        ],
      ),
    );
  }
}

class DeleteDataButton extends StatelessWidget {
  const DeleteDataButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(PolicyPage.routeName);
        Provider.of<UserProvider>(context, listen: false).deleteUser();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Center(
          child: Text('Eliminar mis datos'),
        ),
      ),
    );
  }
}
