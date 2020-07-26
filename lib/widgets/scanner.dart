import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../src/domain/place.dart';
import '../src/helpers/scanned_code.dart';

class SliverScanner extends StatefulWidget {
  const SliverScanner({
    Key key,
    this.onScan,
  }) : super(key: key);

  final String scanLabel = 'Escanea el código QR';
  final String codelabel = 'Lugar registrado';
  final int delaySeconds = 10;

  final void Function(Place result) onScan;

  @override
  _SliverScannerState createState() => _SliverScannerState();
}

class _SliverScannerState extends State<SliverScanner> {
  final GlobalKey key = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  bool disabled = false;
  String result = '';

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      if (!disabled) {
        disabled = true;
        widget.onScan(ScannedCode(result).toPlace());
      }

      Future.delayed(Duration(seconds: widget.delaySeconds), () {
        disabled = false;
        setState(() {});
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
        Stack(children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: QRView(
              key: key,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: disabled ? Colors.transparent : Colors.white,
                borderLength: 24.0,
                borderWidth: 8.0,
                cutOutSize: 160.0,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Text(
                disabled ? widget.codelabel : widget.scanLabel,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ]),
      ]),
    );
  }
}
