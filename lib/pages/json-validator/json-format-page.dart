import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class JsonFormatPage extends StatefulWidget {
  @override
  _JsonFormatPageState createState() => _JsonFormatPageState();
}

class _JsonFormatPageState extends State<JsonFormatPage> {
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
                : Text("Decoded JSON copied to clipboard!"),
          );
        }).then((val) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  String decodeJSON(String jsonString) {
    String output = "";
    try {
      var decodedJSON = json.decode(jsonString) as Map<String, dynamic>;
      output = prettyJson(decodedJSON, indent: 2);
    } on FormatException catch (_) {
      showDialog(
          context: context,
          builder: (context) {
            _timer = Timer(Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              content: Text("The provided string is not a valid JSON!"),
            );
          }).then((val) {
        if (_timer.isActive) {
          _timer.cancel();
        }
      });
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => SafeArea(
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'JSON Input:',
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
                      'Formatted JSON:',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildDisplayBox(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildDecodeButton(context),
                    _buildCopyButton(context)
                  ],
                ),
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
            labelText: 'JSON to be formatted',
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
          var decodedJSON = decodeJSON(value);
          setState(() {
            _text = decodedJSON;
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
        height: 200,
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

  Widget _buildDecodeButton(context) {
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
          child: Text(
            "Format JSON",
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Colors.white),
          ),
        ));
  }
}
