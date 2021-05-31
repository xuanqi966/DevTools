import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class QrGeneratePage extends StatefulWidget {
  @override
  _QrGeneratePageState createState() => _QrGeneratePageState();
}

class _QrGeneratePageState extends State<QrGeneratePage> {
  GlobalKey globalKey = new GlobalKey();
  String _dataString = "";
  String _inputErrorText;
  final TextEditingController _controller = TextEditingController();

  void _generateCode() {
    setState(() {
      _dataString = _controller.text;
      _inputErrorText = null;
    });
  }

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      final directory = await getTemporaryDirectory();

      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      File imageFile = new File('${directory.path}/image.png');
      imageFile.writeAsBytes(pngBytes);
      final RenderBox box = context.findRenderObject();
      Share.shareFiles(['${directory.path}/image.png'],
          subject: 'Share QR Code',
          text: 'Share the generated QR Code',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _captureAndSavePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();

      PermissionStatus storageStatus = await Permission.storage.status;
      if (storageStatus != PermissionStatus.granted) {
        storageStatus = await Permission.storage.request();
        print(storageStatus);
        if (storageStatus != PermissionStatus.granted) {
          throw "Permission denied. Storage access not granted.";
        }
      }

      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      final result =
          await ImageGallerySaver.saveImage(pngBytes.buffer.asUint8List());

      if (result == null || result == '') throw 'Saving failed.';

      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              content: Text("QR Code saved to gallery!"),
            );
          });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildContentWidget();
  }

  Widget _buildContentWidget() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: RepaintBoundary(
                    key: globalKey,
                    child: QrImage(
                      data: _dataString,
                      size: 300,
                      backgroundColor: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 20.0,
                  right: 20.0,
                  bottom: 30,
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  controller: _controller,
                  textInputAction: TextInputAction.done,
                  onChanged: (_) => _generateCode(),
                  decoration: InputDecoration(
                      hintText: "Enter a your message",
                      errorText: _inputErrorText,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton(
                        "Share",
                        Icon(Icons.share, color: Colors.white),
                        Colors.black,
                        _captureAndSharePng),
                    _buildButton(
                        "Save",
                        Icon(Icons.file_download, color: Colors.white),
                        Colors.grey,
                        _captureAndSavePng)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      String title, Icon icon, Color bgColor, Function function) {
    return Container(
      width: 120,
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(title, style: Theme.of(context).textTheme.button)
          ],
        ),
        onPressed: function,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all(bgColor)),
      ),
    );
  }
}
