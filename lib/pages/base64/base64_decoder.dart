import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Decoder extends StatefulWidget {
  const Decoder({Key key}) : super(key: key);

  @override
  _DecoderState createState() => _DecoderState();
}

class _DecoderState extends State<Decoder> {
  final _formKey = GlobalKey<FormState>();
  String text = "";
  String decoded = "";
  Timer _timer;

  void copyContent(BuildContext context) {
    Clipboard.setData(ClipboardData(
        text: decoded == "Please key in Base64 message above" ? "" : decoded));
    showDialog(
        context: context,
        builder: (context) {
          _timer = Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: decoded == "Please key in Base64 message above"
                ? Text(
                    "Nothing is copied to clipboard",
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "Decoded message copied to clipboard!",
                    textAlign: TextAlign.center,
                  ),
          );
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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Base64 Decoder",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Divider(
                      thickness: 1.0,
                      height: 30.0,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    _buildHeadline("Enter Message: "),
                    SizedBox(
                      height: 20,
                    ),
                    _buildMsg(),
                    SizedBox(
                      height: 30,
                    ),
                    _buildConvertButton(context),
                    SizedBox(
                      height: 30,
                    ),
                    _buildHeadline("Decoded Message: "),
                    SizedBox(
                      height: 20,
                    ),
                    _buildContainer(),
                    SizedBox(
                      height: 30,
                    ),
                    _buildCopyButton(context),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline(String title) {
    return Text(title, style: Theme.of(context).textTheme.headline2);
  }

  Widget _buildMsg() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              )),
          filled: true,
          fillColor: Colors.white60,
          contentPadding: EdgeInsets.all(15.0),
          labelText: 'Message',
          hintText: 'Your messages',
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          )),
          labelStyle: TextStyle(fontSize: 16)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter your message in Base64!';
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      maxLines: 5,
      onSaved: (String value) {
        setState(() {
          text = value;
        });
      },
      onFieldSubmitted: (_) {},
    );
  }

  Widget _buildContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: _findDecodedText(text),
      ),
    );
  }

  Widget _findDecodedText(String message) {
    setState(() {
      if (message == "") {
        decoded = "Please key in Base64 message above";
      } else {
        try {
          Codec<String, String> stringToBase64 = utf8.fuse(base64);
          decoded = stringToBase64.decode(message);
        } catch (e) {
          decoded = "Please enter valid message!";
        }
      }
    });

    return Text(decoded, style: Theme.of(context).textTheme.bodyText1);
  }

  Widget _buildConvertButton(context) {
    return Container(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            if (!_formKey.currentState.validate()) {
              return;
            }
            _formKey.currentState.save();
            _formKey.currentState.reset();
          },
          child: Text(
            "Convert to String",
            style: Theme.of(context).textTheme.button,
          ),
        ));
  }

  Widget _buildCopyButton(BuildContext context) {
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
      onPressed: () => copyContent(context),
    );
  }
}
