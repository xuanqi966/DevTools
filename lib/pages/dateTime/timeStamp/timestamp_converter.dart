import 'package:dev_tools/pages/udp/sender-page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class TimeStamp extends StatefulWidget {
  const TimeStamp({Key key}) : super(key: key);

  @override
  _TimeStampState createState() => _TimeStampState();
}

class _TimeStampState extends State<TimeStamp> {
  String text = "";
  DateTime date;
  String convertedDateTime = "";
  Timer _timer;
  final _formKey = GlobalKey<FormState>();

  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd MMMM yyyy').format(date);
    }
  }

  void copyContent(BuildContext context) {
    Clipboard.setData(ClipboardData(
        text: convertedDateTime == "Please key in time stamp above"
            ? ""
            : convertedDateTime));
    showDialog(
        context: context,
        builder: (context) {
          _timer = Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: convertedDateTime == "Please key in time stamp above"
                ? Text(
                    "Nothing is copied to clipboard",
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "Converted time copied to clipboard!",
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
                  children: <Widget>[
                    Text(
                      "TimeStamp to DateTime",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Divider(
                      thickness: 1.0,
                      height: 30.0,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    _buildHeadline("Enter a Timestamp: "),
                    SizedBox(
                      height: 20,
                    ),
                    _buildTextFormField(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildConvertButton(context),
                    SizedBox(
                      height: 30,
                    ),
                    _buildHeadline("Time in SGT: "),
                    SizedBox(
                      height: 20,
                    ),
                    _buildSGTContainer(),
                    SizedBox(
                      height: 20,
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

  Widget _buildSGTContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(child: _findSGDateTime(text)),
    );
  }

  Widget _findSGDateTime(String timeStamp) {
    setState(() {
      if (timeStamp == "") {
        convertedDateTime = "Please key in time stamp above";
      } else {
        DateTime newDateTime =
            DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp) * 1000);
        convertedDateTime =
            DateFormat("EEE, dd MMMM yyyy, hh:mm:ss aa").format(newDateTime);
      }
    });

    return Text(convertedDateTime,
        style: Theme.of(context).textTheme.bodyText1);
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
            "Convert to SGT",
            style: Theme.of(context).textTheme.button,
          ),
        ));
  }

  Widget _buildTextFormField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              )),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          )),
          filled: true,
          fillColor: Colors.white60,
          contentPadding: EdgeInsets.all(15.0),
          hintText: "Please key in Timestamp in seconds",
          labelText: "Timestamp",
          labelStyle: TextStyle(fontSize: 16),
        ),
        validator: (value) {
          if (!isNumeric(value)) {
            return "Please enter a numeric number";
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            text = value;
          });
        });
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
