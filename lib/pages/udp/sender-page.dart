import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../../models/udpSender.dart';

class SenderPage extends StatefulWidget {
  @override
  _SenderPageState createState() => _SenderPageState();
}

class _SenderPageState extends State<SenderPage> {
  // Variables to be kept track of
  InternetAddress _address;
  int _port;
  String _message;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // build methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              defaultTargetPlatform == TargetPlatform.iOS
                  ? Icons.arrow_back_ios
                  : Icons.arrow_back,
              size: 25,
            ),
            color: Colors.blue[600],
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.email),
              iconSize: 25.0,
              tooltip: "Receive",
              color: Colors.blue[600],
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "UDP Sender",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Divider(
                      thickness: 1.0,
                      height: 30.0,
                    ),
                    _buildHeadline("Enter an Address: "),
                    _buildIp(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildHeadline("Enter a Port Number: "),
                    _buildPort(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildHeadline("Enter a Message: "),
                    _buildMsg(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();

                            udpSend(_port, _address, _message);

                            _formKey.currentState.reset();

                            showSentDialog(
                                context,
                                (_address == null)
                                    ? "Message Broadcasted!"
                                    : "Message Sent!",
                                (_address == null)
                                    ? '255.255.255.255'
                                    : _address.toString(),
                                _port.toString(),
                                _message);
                          },
                          child: Text('Send Message',
                              style: Theme.of(context).textTheme.button)),
                    )
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

  Widget _buildIp() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
            labelText: 'IP Address',
            hintText: 'Destination IP Address',
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            )),
            labelStyle: TextStyle(fontSize: 16)),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        validator: (String value) {
          if (value == "") {
            return null;
          }
          if (!validator.ip(value)) {
            return 'Please enter a valid IP Address';
          }
          return null;
        },
        onSaved: (String value) {
          if (value == "") {
            _address = null;
            return;
          }
          _address = InternetAddress(value);
        },
      ),
    );
  }

  Widget _buildPort() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
              labelText: 'Port Number',
              hintText: 'Destination Port Number',
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              )),
              labelStyle: TextStyle(fontSize: 16)),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (String value) {
            if (!isNumeric(value)) {
              return 'Please enter a numerical Port Number';
            }
            return null;
          },
          onSaved: (String value) {
            _port = int.parse(value);
          }),
    );
  }

  Widget _buildMsg() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
            labelText: 'Message',
            hintText: 'Your messages',
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            )),
            labelStyle: TextStyle(fontSize: 16)),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter your message!';
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        maxLines: 5,
        onSaved: (String value) {
          _message = value;
        },
        onFieldSubmitted: (_) {},
      ),
    );
  }

  void showSentDialog(
      BuildContext context, String title, String ip, String port, String msg) {
    Widget okButton = TextButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size.fromHeight(20))),
        onPressed: () => Navigator.of(context).pop(),
        child: Text(
          "OK",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.blue),
        ));
    Widget sentDialog = CupertinoAlertDialog(
      title: Text(title, style: Theme.of(context).textTheme.headline2),
      content: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 12.0,
              ),
              _buildMessageTitleText("Dest IP: ", context),
              SizedBox(
                height: 5.0,
              ),
              _buildMessageText(ip, context),
              SizedBox(
                height: 10.0,
              ),
              _buildMessageTitleText("Dest Port: ", context),
              SizedBox(
                height: 5.0,
              ),
              _buildMessageText(port, context),
              SizedBox(
                height: 10.0,
              ),
              _buildMessageTitleText("Message: ", context),
              SizedBox(
                height: 5.0,
              ),
              _buildMessageText(msg, context),
            ],
          ),
        ),
      ),
      actions: [Center(child: okButton)],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return sentDialog;
        });
  }

  Widget _buildMessageText(String msg, BuildContext context) {
    return Text(msg,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Colors.black54));
  }
}

Widget _buildMessageTitleText(String msg, BuildContext context) {
  return Text(msg,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          .copyWith(fontWeight: FontWeight.w600));
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null;
}
