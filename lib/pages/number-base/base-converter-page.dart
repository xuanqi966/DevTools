import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:baseconvert/baseconvert.dart';

class BaseConverterPage extends StatefulWidget {
  @override
  _BaseConverterPageState createState() => _BaseConverterPageState();
}

class _BaseConverterPageState extends State<BaseConverterPage> {
  Map<String, int> _baseMap = {
    '2 (Binary)': 2,
    '8 (Octal)': 8,
    '10 (Decimal)': 10,
    '16 (Hex)': 16
  };

  TextEditingController _inputController = TextEditingController();
  String _chosenFromBase;
  String _chosenToBase;
  String _resultNumber;

  void _convertHandler() {
    setState(() {
      _resultNumber = base(_inputController.text,
          inBase: _baseMap[_chosenFromBase],
          outBase: _baseMap[_chosenToBase],
          string: true);
    });
  }

  void _resetHandler() {
    setState(() {
      _chosenFromBase = '10 (Decimal)';
      _chosenToBase = '16 (Hex)';
      _resultNumber = '';
      _inputController.clear();
    });
  }

  void _copyHandler(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _resultNumber));
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text("Number copied to clipboard!"),
          );
        });
  }

  @override
  void initState() {
    _chosenFromBase = '10 (Decimal)';
    _chosenToBase = '16 (Hex)';
    _resultNumber = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Number Base Converter",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Divider(
                  thickness: 1.0,
                  height: 30.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter Number:',
                  style: Theme.of(context).textTheme.headline2,
                ),
                _buildDropdownContainer(_buildNumberInput()),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'From Base:',
                  style: Theme.of(context).textTheme.headline2,
                ),
                _buildDropdownContainer(_buildFromBase()),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'To Base:',
                  style: Theme.of(context).textTheme.headline2,
                ),
                _buildDropdownContainer(_buildToBase()),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Result Number:',
                  style: Theme.of(context).textTheme.headline2,
                ),
                _buildNumberOutput(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildButton(
                        'Convert',
                        _convertHandler,
                        Icon(
                          Icons.functions,
                          color: Colors.white,
                        )),
                    _buildButton('Reset', _resetHandler,
                        Icon(FontAwesome.remove, color: Colors.white)),
                    _buildButton('Copy', () => _copyHandler(context),
                        Icon(Icons.content_copy, color: Colors.white))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownContainer(Widget dropdown) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: dropdown,
    );
  }

  Widget _buildNumberInput() {
    return TextField(
      controller: _inputController,
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
        labelText: 'Number',
        hintText: 'Enter Number',
      ),
    );
  }

  Widget _buildFromBase() {
    return DropdownButton(
      isExpanded: true,
      value: _chosenFromBase,
      focusColor: Colors.white,
      items: _baseMap.keys.toList().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (String value) {
        setState(() {
          _chosenFromBase = value;
        });
      },
      hint: Text('From Base'),
    );
  }

  Widget _buildToBase() {
    return DropdownButton(
      isExpanded: true,
      value: _chosenToBase,
      focusColor: Colors.white,
      items: _baseMap.keys.toList().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (String value) {
        setState(() {
          _chosenToBase = value;
        });
      },
      hint: Text('From Base'),
    );
  }

  Widget _buildNumberOutput() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        padding: EdgeInsets.all(16),
        height: 70,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
            child: Text(_resultNumber,
                style: Theme.of(context).textTheme.bodyText1)));
  }

  Widget _buildButton(String title, Function onPressed, Icon icon) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
        child: OutlinedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(title, style: Theme.of(context).textTheme.button),
            ],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
