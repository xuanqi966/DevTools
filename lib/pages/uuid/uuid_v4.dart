import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class UUIDV4 extends StatefulWidget {
  const UUIDV4({Key key}) : super(key: key);

  @override
  _UUIDV4State createState() => _UUIDV4State();
}

class _UUIDV4State extends State<UUIDV4> {
  var uuid = Uuid();
  var v4 = "";
  var v4_crypto = "";
  Timer _timer;

  void copyContent(BuildContext context, bool isCrypto) {
    Clipboard.setData(ClipboardData(text: isCrypto ? v4_crypto : v4));
    showDialog(
        context: context,
        builder: (context) {
          _timer = Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              content: isCrypto
                  ? (v4_crypto == ""
                      ? Text(
                          "Nothing is copied to clipboard",
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          "V4 Crypto UUID copied to clipboard!",
                          textAlign: TextAlign.center,
                        ))
                  : (v4 == ""
                      ? Text(
                          "Nothing is copied to clipboard",
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          "V4 UUID copied to clipboard!",
                          textAlign: TextAlign.center,
                        )));
        }).then((val) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "V4 UUID Generator",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Divider(
                  thickness: 1.0,
                  height: 30.0,
                ),
                SizedBox(
                  height: 15,
                ),
                _buildHeadline("Generate Random ID:"),
                SizedBox(
                  height: 20,
                ),
                _buildConvertButton(context, false),
                SizedBox(
                  height: 30,
                ),
                _buildContainer(
                    v4 == "" ? "Please click button above!" : v4.toString()),
                SizedBox(
                  height: 20,
                ),
                _buildCopyButton(context, false),
                SizedBox(
                  height: 30,
                ),
                _buildHeadline("Generate Crypto-Random ID:"),
                SizedBox(
                  height: 20,
                ),
                _buildConvertButton(context, true),
                SizedBox(
                  height: 30,
                ),
                _buildContainer(v4_crypto == ""
                    ? "Please click button above!"
                    : v4_crypto.toString()),
                SizedBox(
                  height: 20,
                ),
                _buildCopyButton(context, true),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline(String title) {
    return Text(title, style: Theme.of(context).textTheme.headline2);
  }

  Widget _buildContainer(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildConvertButton(context, bool isCrypto) {
    return Container(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              if (!isCrypto) {
                v4 = uuid.v4();
              } else if (isCrypto) {
                v4_crypto = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
              }
            });
          },
          child: Text(
            "Generate V4 ID",
            style: Theme.of(context).textTheme.button,
          ),
        ));
  }

  Widget _buildCopyButton(BuildContext context, bool isCrypto) {
    return OutlinedButton(
      child: Text("Copy to Clipboard",
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(color: Colors.blue[600])),
      style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: Colors.blue[600])),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey;
            } else {
              return Colors.white30;
            }
          })),
      onPressed: () => copyContent(context, isCrypto),
    );
  }
}
