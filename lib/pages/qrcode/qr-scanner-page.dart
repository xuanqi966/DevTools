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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child:
              Text("Message: ", style: Theme.of(context).textTheme.headline2),
        ),
        Container(
            width: 300,
            height: 200,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
                child: Text(_scanCode,
                    style: Theme.of(context).textTheme.bodyText1)))
      ],
    );
  }

  Widget _buildScanButton() {
    return Container(
      width: 130,
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_scanner, color: Colors.white),
            SizedBox(
              width: 5,
            ),
            Text("Scan",
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.white))
          ],
        ),
        onPressed: scanQR,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStateProperty.all(
              Colors.black,
            )),
      ),
    );
  }

  Widget _buildCopyButton(BuildContext context) {
    return Container(
      width: 130,
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.copy, color: Colors.blueGrey[800]),
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
