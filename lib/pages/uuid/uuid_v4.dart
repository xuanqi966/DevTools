import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class UUIDV4 extends StatefulWidget {
  const UUIDV4({Key key}) : super(key: key);

  @override
  _UUIDV4State createState() => _UUIDV4State();
}

class _UUIDV4State extends State<UUIDV4> {
  var uuid = Uuid();
  var v4 = null;
  var v4_crypto = null;

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
                  "V4 UUID Generator",
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
                _buildConvertButton(context, false),
                SizedBox(
                  height: 30,
                ),
                _buildContainer(
                    v4 == null ? "Please click button above!" : v4.toString()),
                SizedBox(
                  height: 50,
                ),
                _buildHeadline("Generate Crypto-Random ID:"),
                SizedBox(
                  height: 20,
                ),
                _buildConvertButton(context, true),
                SizedBox(
                  height: 30,
                ),
                _buildContainer(v4_crypto == null
                    ? "Please click button above!"
                    : v4_crypto.toString()),
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

  Widget _buildContainer(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildConvertButton(context, bool isCrypto) {
    return Container(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              if (!isCrypto) {
                v4 = uuid.v4();
              } else if (isCrypto) {
                v4_crypto = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
              }
            });
          },
          child: Text(
            "Generate V4 ID",
            style: Theme.of(context).textTheme.button,
          ),
        ));
  }
}
