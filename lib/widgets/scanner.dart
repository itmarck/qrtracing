import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class SliverScanner extends StatefulWidget {
  const SliverScanner({
    Key key,
    this.onScan,
  }) : super(key: key);

  final String label = 'Escanea el código QR';
  final void Function(String result) onScan;

  @override
  _SliverScannerState createState() => _SliverScannerState();
}

class _SliverScannerState extends State<SliverScanner> {
  final GlobalKey key = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  String result = '';

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        widget.onScan(result);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
        Stack(children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              child: QRView(
                key: key,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.white,
                  borderLength: 24.0,
                  borderWidth: 8.0,
                  cutOutSize: 160.0,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Text(
                widget.label,
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
