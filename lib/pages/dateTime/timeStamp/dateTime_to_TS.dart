import 'package:dev_tools/pages/udp/sender-page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dev_tools/pages/dateTime/timezone/button_picker.dart';

class DateTimeToTS extends StatefulWidget {
  const DateTimeToTS({Key key}) : super(key: key);

  @override
  _DateTimeToTSState createState() => _DateTimeToTSState();
}

class _DateTimeToTSState extends State<DateTimeToTS> {
  DateTime date;
  int hour, minutes, seconds;
  final _formKey = GlobalKey<FormState>();

  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd MMMM yyyy').format(date);
    }
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: date ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark(),
            child: child,
          );
        });

    if (newDate == null) return;

    setState(() => date = newDate);
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
                    ButtonHeaderWidget(
                      title: "Enter a Date: ",
                      text: getText(),
                      onClicked: () => pickDate(context),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildHeadline("Enter a time:"),
                    SizedBox(
                      height: 10,
                    ),
                    _buildSubTextFormField(
                        "Hours(24 hours)", "Please enter your hours", 1),
                    _buildSubTextFormField(
                        "Minutes", "Please enter your minutes ", 2),
                    _buildSubTextFormField(
                        "Seconds", "Please enter your seconds", 3),
                    SizedBox(
                      height: 10,
                    ),
                    _buildConvertButton(context),
                    SizedBox(
                      height: 30,
                    ),
                    _buildHeadline("Unix Timestamp (Milliseconds): "),
                    SizedBox(
                      height: 20,
                    ),
                    _buildSGTContainer(),
                    SizedBox(
                      height: 10,
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
            "Convert to Timestamp",
            style: Theme.of(context).textTheme.button,
          ),
        ));
  }

  Widget _buildSGTContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(child: _findSGDateTime(date, hour, minutes, seconds)),
    );
  }

  Widget _findSGDateTime(DateTime date, int hour, int minutes, int seconds) {
    String convertedDateTime;

    if (date == null || hour == null || minutes == null || seconds == null) {
      convertedDateTime = "Please key in date and time above";
    } else {
      DateTime newDateTime =
          DateTime(date.year, date.month, date.day, hour, minutes, seconds);
      int timeStamp = newDateTime.millisecondsSinceEpoch ~/ 1000;
      convertedDateTime = timeStamp.toString();
    }

    return Text(convertedDateTime,
        style: Theme.of(context).textTheme.bodyText1);
  }

  Widget _buildHeadline(String title) {
    return Text(title, style: Theme.of(context).textTheme.headline2);
  }

  Widget _buildSubTextFormField(String labelText, String hintText, int number) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              )),
              filled: true,
              fillColor: Colors.white60,
              contentPadding: EdgeInsets.all(15.0),
              hintText: hintText,
              labelText: labelText,
              labelStyle: TextStyle(fontSize: 16),
            ),
            validator: (value) {
              if (!isNumeric(value)) {
                return "Please enter a numeric number";
              } else if ((number == 1) &&
                  (int.parse(value) < 0 || int.parse(value) > 23)) {
                return "Please enter a valid hour";
              } else if ((number == 2) &&
                  (int.parse(value) < 0 || int.parse(value) > 60)) {
                return "Please enter a valid minute";
              } else if ((number == 3) &&
                  (int.parse(value) < 0 || int.parse(value) > 60)) {
                return "Please enter a valid second";
              }
              return null;
            },
            onSaved: (value) {
              setState(() {
                if (number == 1) {
                  hour = int.parse(value);
                } else if (number == 2) {
                  minutes = int.parse(value);
                } else if (number == 3) {
                  seconds = int.parse(value);
                } else {
                  return;
                }
              });
            }),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
