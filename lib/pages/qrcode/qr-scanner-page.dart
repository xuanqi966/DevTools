import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScannerPage extends StatefulWidget {
  @override
  _QrScannerPageState createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  String _scanCode = "";

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = "Failed to get platform version.";
    }

    if (!mounted) return;

    setState(() {
      _scanCode = barcodeScanRes;
    });
  }

  void copyContent(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _scanCode));
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Content copied to clipboard!"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildContentSection(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [_buildScanButton(), _buildCopyButton(context)],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "QR Code Scanner",
            style: Theme.of(context).textTheme.headline1,
          ),
          Divider(
            thickness: 1.0,
            height: 30.0,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child:
                Text("Message: ", style: Theme.of(context).textTheme.headline2),
          )),
          Center(
            child: Container(
                width: 300,
                height: 200,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                    child: Text(_scanCode,
                        style: Theme.of(context).textTheme.bodyText1))),
          )
        ],
      ),
    );
  }

  Widget _buildScanButton() {
    return Container(
        width: 130,
        child: OutlinedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code_scanner, color: Colors.blue[600]),
              SizedBox(
                width: 5,
              ),
              Text("Scan",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.blue[600]))
            ],
          ),
          onPressed: scanQR,
          style: ButtonStyle(
            side:
                MaterialStateProperty.all(BorderSide(color: Colors.blue[600])),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey;
              } else {
                return Colors.white30;
              }
            }),
          ),
        ));
  }

  Widget _buildCopyButton(BuildContext context) {
    return Container(
      width: 130,
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.copy, color: Colors.white),
            SizedBox(
              width: 5,
            ),
            Text("Copy", style: Theme.of(context).textTheme.button)
          ],
        ),
        onPressed: () => copyContent(context),
      ),
    );
  }
}
