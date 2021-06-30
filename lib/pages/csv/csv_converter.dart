import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:csv/csv.dart';

class CSVConverter extends StatefulWidget {
  const CSVConverter({Key key}) : super(key: key);

  @override
  _CSVConverterState createState() => _CSVConverterState();
}

class _CSVConverterState extends State<CSVConverter> {
  final _formKey = GlobalKey<FormState>();
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(30.0), child: AppBar()),
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
                      "Json to CSV",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Divider(
                      thickness: 1.0,
                      height: 30.0,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    _buildHeadline("Enter Json Text: "),
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
                    _buildHeadline("CSV text: "),
                    SizedBox(
                      height: 20,
                    ),
                    _buildContainer(),
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
          labelText: 'Json Text',
          hintText: 'Your Json Text',
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          )),
          labelStyle: TextStyle(fontSize: 16)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter your Json Text!';
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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: convertToCSV(text),
      ),
    );
  }

  Widget convertToCSV(String text) {
    List<List<dynamic>> list = [];
    Map<String, dynamic> jsonArr;
    List<dynamic> title = [];

    if (text != "") {
      try {
        jsonArr = decodeJSON(text);
      } catch (e) {
        return Text("Please key in valid JSON code");
      }

      jsonArr.forEach((key, value) {
        title = [];
        title.add(key);
        list.add(title);
        list.add(value);
      });

      String csv = const ListToCsvConverter().convert(list);

      return _buildTable(csv, title) ?? Text("loading..");
    } else {
      return Text("Please key in JSON text above",
          style: Theme.of(context).textTheme.bodyText1);
    }
  }

  Widget _buildTable(String csv, List<dynamic> title) {
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csv) ?? [];
    List<String> wordsArr = [];

    return Column(
      children: csvTable.map((item) {
        return Container(
          width: double.infinity,
          child: Column(
              children: item.map((row) {
            row = row.replaceAll("{", "");
            row = row.replaceAll("}", "");
            wordsArr = row.split(",");
            return Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: wordsArr.map((element) {
                    return Container(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Text(element.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1),
                    );
                  }).toList(),
                ),
                Divider(
                  thickness: 1.0,
                ),
              ],
            );
          }).toList()),
        );
      }).toList(),
    );
  }

  Map<String, dynamic> decodeJSON(String jsonString) {
    String output = "";

    var decodedJSON = json.decode(jsonString) as Map<String, dynamic>;

    decodedJSON.keys.forEach((element) {
      output += element + ":" + decodedJSON[element].toString() + "\n";
    });

    return decodedJSON;
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
            "Convert to CSV",
            style: Theme.of(context).textTheme.button,
          ),
        ));
  }
}
