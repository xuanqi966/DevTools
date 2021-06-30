import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class JsonValidatorPage extends StatefulWidget {
  @override
  _JsonValidatorPageState createState() => _JsonValidatorPageState();
}

class _JsonValidatorPageState extends State<JsonValidatorPage> {
  final _formKey = GlobalKey<FormState>();

  String _text = '';

  void copyContent(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _text));
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Decoded JSON copied to clipboard!"),
          );
        });
  }

  String decodeJSON(String jsonString) {
    String output = "";
    try {
      var decodedJSON = json.decode(jsonString) as Map<String, dynamic>;
      decodedJSON.keys.forEach((key) {
        output += key + " : " + decodedJSON[key].toString() + "\n";
      });
    } on FormatException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              content: Text("The provided string is not a valid JSON!"),
            );
          });
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "JSON Validator",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: LayoutBuilder(
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
                        'Decoded JSON:',
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
            labelText: 'JSON to be encoded',
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
            "Decode JSON",
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Colors.white),
          ),
        ));
  }
}
