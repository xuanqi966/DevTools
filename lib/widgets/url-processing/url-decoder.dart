import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class UrlDecoder extends StatefulWidget {
  @override
  _UrlDecoderState createState() => _UrlDecoderState();
}

class _UrlDecoderState extends State<UrlDecoder> {
  final _formKey = GlobalKey<FormState>();
  Timer _timer;

  String _text = '';

  void copyContent(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _text));
    showDialog(
        context: context,
        builder: (context) {
          _timer = Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: _text == ""
                ? Text(
                    "Nothing is copied to clipboard",
                    textAlign: TextAlign.center,
                  )
                : Text("Decoded URL copied to clipboard!"),
          );
        }).then((val) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "URL Decoder",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(
                    thickness: 1.0,
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'URL Input:',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildInputBox(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Decoded URL:',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildDisplayBox(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildEncodeButton(context),
                  _buildCopyButton(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputBox() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                )),
            filled: true,
            fillColor: Colors.white60,
            contentPadding: EdgeInsets.all(15.0),
            labelText: 'URL to be decoded',
            hintText: 'Your Input',
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            )),
            labelStyle: TextStyle(fontSize: 16)),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Your input is empty!';
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        maxLines: 5,
        onSaved: (value) {
          var encodedText = Uri.encodeFull(value);
          setState(() {
            _text = encodedText;
          });
        },
      ),
    );
  }

  Widget _buildDisplayBox() {
    return Container(
        margin: EdgeInsets.all(8),
        width: double.infinity,
        padding: EdgeInsets.all(16),
        height: 150,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
            child: Text(_text, style: Theme.of(context).textTheme.bodyText1)));
  }

  Widget _buildCopyButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: OutlinedButton(
        child: Text("Copy to Clipboard",
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Colors.blue[600])),
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
            })),
        onPressed: () => copyContent(context),
      ),
    );
  }

  Widget _buildEncodeButton(context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: OutlinedButton(
          onPressed: () {
            if (!_formKey.currentState.validate()) {
              return;
            }
            _formKey.currentState.save();
            _formKey.currentState.reset();
          },
          child: Text("Convert to decoded URL",
              style: Theme.of(context).textTheme.button),
        ));
  }
}
