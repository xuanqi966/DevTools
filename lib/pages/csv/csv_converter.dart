import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ext_storage/ext_storage.dart';

class CSVConverter extends StatefulWidget {
  const CSVConverter({Key key}) : super(key: key);

  @override
  _CSVConverterState createState() => _CSVConverterState();
}

class _CSVConverterState extends State<CSVConverter> {
  final _formKey = GlobalKey<FormState>();
  String text = "";
  String csv = "";

  String fileName = "";

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
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: convertToCSV(text),
      ),
    );
  }

  Widget convertToCSV(String text) {
    List<List<dynamic>> rows = [];
    Map<String, dynamic> jsonArr;
    List<dynamic> row = [];
    List<dynamic> title = [];
    List<dynamic> emptyLine = [];
    List heading = [];

    if (text != "") {
      try {
        csv = "";
        rows = [];
        fileName = "";

        jsonArr = decodeJSON(text);

        jsonArr.forEach((key, value) {
          setState(() {
            fileName += key + " ";
          });
          title = [];
          title.add(key);
          rows.add(title);
          row = [];

          //add heading for each key
          for (int i = 0; i < value.length; i++) {
            List newList = value[i].keys.toList();

            for (int j = 0; j < newList.length; j++) {
              if (!row.contains(newList[j])) {
                row.add(newList[j]);
              }
            }
          }

          heading = row;

          rows.add(row);

          //add the respective sub elements for each heading
          for (int i = 0; i < value.length; i++) {
            row = [];
            row.length = heading.length;
            List newList = value[i].keys.toList();

            for (int j = 0; j < newList.length; j++) {
              for (int k = 0; k < heading.length; k++) {
                if (newList[j] == heading[k]) {
                  row[k] = value[i][newList[j]];
                } else if (row[k] == null) {
                  row[k] = "";
                }
              }
            }
            rows.add(row);
          }

          heading = [];
          emptyLine.add("");
          rows.add(emptyLine);
        });

        setState(() {
          csv = const ListToCsvConverter().convert(rows);
        });

        Platform.isIOS ? _getCSV() : _generateCsvFile();
      } catch (e) {
        print(e.toString());
        return Text("Please key in valid JSON code",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1);
      }

      return Platform.isIOS
          ? Text("Converted!\n Please go to Files > Browse > On my iPhone",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1)
          : Text("Converted!\n Please go to Downloads Folder",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1);
    } else {
      return Text("Please key in JSON text above",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1);
    }
  }

  Map<String, dynamic> decodeJSON(String jsonString) {
    // String output = "";

    var decodedJSON = json.decode(jsonString) as Map<String, dynamic>;

    // decodedJSON.keys.forEach((element) {
    //   output += element + ":" + decodedJSON[element].toString() + "\n";
    // });

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

  void _getCSV() async {
    /// Write to a file
    final directory = await getApplicationDocumentsDirectory();
    final pathOfTheFileToWrite = directory.path + "/${fileName}.csv";
    File file = await File(pathOfTheFileToWrite);
    file.writeAsString(csv);
  }

  void _generateCsvFile() async {
    // Map<Permission, PermissionStatus> statuses =
    await [
      Permission.storage,
    ].request();
    String dir = await ExtStorage.getExternalStoragePublicDirectory(
        ExtStorage.DIRECTORY_DOWNLOADS);
    //print("dir $dir");
    String file = "$dir";

    File f = File(file + "/${fileName}.csv");

    f.writeAsString(csv);
  }
}
