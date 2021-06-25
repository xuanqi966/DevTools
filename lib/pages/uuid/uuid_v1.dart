import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UUIDV1 extends StatefulWidget {
  const UUIDV1({Key key}) : super(key: key);

  @override
  _UUIDV1State createState() => _UUIDV1State();
}

class _UUIDV1State extends State<UUIDV1> {
  var uuid = Uuid();
  var v1 = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "V1 UUID Generator",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Divider(
                  thickness: 1.0,
                  height: 30.0,
                ),
                SizedBox(
                  height: 15,
                ),
                _buildHeadline("Generate Random ID:"),
                SizedBox(
                  height: 20,
                ),
                _buildConvertButton(context),
                SizedBox(
                  height: 30,
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
    );
  }

  Widget _buildHeadline(String title) {
    return Text(title, style: Theme.of(context).textTheme.headline2);
  }

  Widget _buildContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          v1 == null ? "Please click button above!" : v1.toString(),
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildConvertButton(context) {
    return Container(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              v1 = uuid.v1();
            });
          },
          child: Text(
            "Generate V1 (Time-Based) ID",
            style: Theme.of(context).textTheme.button,
          ),
        ));
  }
}
