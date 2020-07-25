import 'package:flutter/material.dart';
import 'package:qrtracing/src/domain/record.dart';

class RecordWidget extends StatelessWidget {
  RecordWidget({
    @required this.record,
  }) : assert(record != null);

  final Record record;

  @override
  Widget build(BuildContext context) {
    var actualPlace = record.checkOut == null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: actualPlace
            ? Colors.teal.withAlpha(16)
            : Theme.of(context).canvasColor,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (actualPlace)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _CaptionText('Estás en'),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    record.place.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(record.company.name)
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.29,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _CaptionText(
                            actualPlace ? 'Hora de ingreso' : 'Ingreso'),
                        _HourText(
                            '${record.checkIn.hour}:${record.checkIn.minute}')
                      ],
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (!actualPlace) ...[
                          _CaptionText('Salida'),
                          _HourText(
                              '${record.checkOut.hour}:${record.checkOut.minute}')
                        ]
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CaptionText extends StatelessWidget {
  _CaptionText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.0),
    );
  }
}

class _HourText extends StatelessWidget {
  _HourText(this.text);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
    );
  }
}
