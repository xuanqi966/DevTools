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
  Timer _timer;
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
    //try {
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
          _timer = Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: Text(
              "QR Code saved to gallery!",
              textAlign: TextAlign.center,
            ),
          );
        }).then((val) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
    //} catch (e) {
    //print(e.toString());
    // //}
  }

  Future<void> _captureandSavePngIOS() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();

      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);

      Uint8List pngBytes = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

      final directory = await getApplicationDocumentsDirectory();
      final pathOfTheFileToWrite = directory.path;

      final file = await new File('/${pathOfTheFileToWrite}/${_dataString}.png')
          .create();

      await file.writeAsBytes(pngBytes);

      showDialog(
          context: context,
          builder: (context) {
            _timer = Timer(Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              content: Text(
                "QR Code saved to Files!",
                textAlign: TextAlign.center,
              ),
            );
          }).then((val) {
        if (_timer.isActive) {
          _timer.cancel();
        }
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
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "QR Code Generator",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 15.0),
                  child: Divider(
                    thickness: 1.0,
                    height: 30.0,
                  ),
                ),
                Center(
                  child: RepaintBoundary(
                      key: globalKey,
                      child: QrImage(
                        data: _dataString,
                        size: 200,
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
                      filled: true,
                      fillColor: Colors.white60,
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: "Enter a your message",
                      errorText: _inputErrorText,
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          )),
                    ),
                  ),
                ),
                !Platform.isIOS
                    ? Container(
                        padding: EdgeInsets.only(
                            left: 30, right: 30.0, bottom: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildButton(
                                "Share",
                                Icon(Icons.share, color: Colors.blue[600]),
                                Colors.white30,
                                _captureAndSharePng,
                                Colors.blue[600]),
                            _buildButton(
                                "Save",
                                Icon(Icons.file_download, color: Colors.white),
                                Colors.blue[600],
                                _captureAndSavePng,
                                Colors.white)
                          ],
                        ))
                    : Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: _buildButton(
                            "Save to Files",
                            Icon(Icons.file_download, color: Colors.white),
                            Colors.blue[600],
                            _captureandSavePngIOS,
                            Colors.white),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String title, Icon icon, Color bgColor, Function function,
      Color textColor) {
    return Container(
      width: 130,
      child: OutlinedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: 5,
            ),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: textColor))
          ],
        ),
        onPressed: function,
        style: ButtonStyle(
            side:
                MaterialStateProperty.all(BorderSide(color: Colors.blue[600])),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStateProperty.all(bgColor)),
      ),
    );
  }
}
