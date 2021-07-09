import 'dart:async';
import 'package:flutter/material.dart';
import './button_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class TimeConverter extends StatefulWidget {
  const TimeConverter({Key key}) : super(key: key);

  @override
  _TimeConverterState createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  DateTime dateTime;
  String convertedDateTime = "";
  Timer _timer;

  String getText() {
    if (dateTime == null) {
      return "Select Date and Time";
    } else {
      return DateFormat("dd MMMM yyyy hh:mm aa").format(dateTime);
    }
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: dateTime ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return child;
        });

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: dateTime != null
            ? TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
            : initialTime,
        builder: (context, child) {
          return child;
        });

    if (newTime == null) return null;

    return newTime;
  }

  void copyContent(BuildContext context) {
    Clipboard.setData(ClipboardData(
        text: convertedDateTime == "Please key in date and time above"
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
              content: convertedDateTime == "Please key in date and time above"
                  ? Text(
                      "Nothing is copied to clipboard",
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      "Converted time copied to clipboard!",
                      textAlign: TextAlign.center,
                    ));
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
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "PST to SGT",
                style: Theme.of(context).textTheme.headline1,
              ),
              Divider(
                thickness: 1.0,
                height: 30.0,
              ),
              SizedBox(
                height: 15,
              ),
              ButtonHeaderWidget(
                title: "Time in PST: ",
                text: getText(),
                onClicked: () => pickDateTime(context),
              ),
              SizedBox(
                height: 40,
              ),
              Text("Time in SGT: ",
                  style: Theme.of(context).textTheme.headline2),
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
      )),
    );
  }

  Container _buildSGTContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(child: _findSGDateTime(dateTime)),
    );
  }

  Widget _findSGDateTime(DateTime dateTime) {
    setState(() {
      if (dateTime == null) {
        convertedDateTime = "Please key in date and time above";
      } else {
        DateTime newDateTime = dateTime.add(Duration(hours: 15));
        convertedDateTime =
            DateFormat("dd MMMM yyyy hh:mm aa").format(newDateTime);
      }
    });

    return Text(convertedDateTime,
        style: Theme.of(context).textTheme.bodyText1);
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
