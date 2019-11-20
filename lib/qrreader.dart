import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import 'package:storybook_fab/bookreader.dart';
import 'package:storybook_fab/main.dart';

void main() => runApp(MaterialApp(home: QrReader(),));

class QrReader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<QrReader> {
  GlobalKey qrKey = GlobalKey();
  var qrText = "";

  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
                key: qrKey,
                overlay: QrScannerOverlayShape(
                    borderRadius: 10,
                    borderColor: Colors.red,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300),
                onQRViewCreated: _onQRViewcreate),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Scan result: $qrText'),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewcreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {

        /*if (qrText.toString() == "xoloitzcuintle"){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return BookReader();
            }),
          );
        }*/

        switch(scanData.toString()){
          case "Xolo":{
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return BookReader();
              }),
            );
          }
          break;
          case "Catrina":{
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return BookReader();
              }),
            );
          }
          break;
          case "María":{
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return BookReader();
              }),
            );
          }
          break;
          case "Reyes":{
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return BookReader();
              }),
            );
          }
          break;

          default:{
            qrText = scanData;
          }
          break;
        }
      });
    });
  }
}
