import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrtracing/src/domain/record.dart';

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
            child: FutureBuilder<List<Record>>(
              future: provider.getHistory(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    var records = snapshot.data;
                    return Column(
                        children: records
                            .map((record) => RecordWidget(record: record))
                            .toList());
                    break;
                  case ConnectionState.waiting:
                    return LinearProgressIndicator();
                  default:
                    return Center(
                      child: Text('Algo salió mal'),
                    );
                }
              },
            ),
          ),
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
        Provider.of<UserProvider>(context, listen: false).deleteUser();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Center(
          child: Text('Eliminar todos mis datos'),
        ),
      ),
    );
  }
}
