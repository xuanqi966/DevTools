import 'package:dev_tools/pages/udp/sender-page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/message.dart';

import 'package:udp/udp.dart';

class ReceiverPage extends StatefulWidget {
  @override
  _ReceiverPageState createState() => _ReceiverPageState();
}

class _ReceiverPageState extends State<ReceiverPage> {
  //========================= Global variables =========================//
  int _myPort;
  var udpReceiver;
  bool isReceiving = false;
  // Progress bar circular, receiver open, button change
  List<Message> _messages = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //========================= Helper functions =========================//
  void udpReceive(int myPort) async {
    udpReceiver = await UDP.bind(Endpoint.any(port: Port(myPort)));

    await udpReceiver.listen((datagram) {
      var message = String.fromCharCodes(datagram.data);
      var senderAddress = datagram.address.address;
      _updateMsgList(senderAddress, message);
    });
  }

  void _updateMsgList(String senderAddress, String message) {
    setState(() {
      _messages.add(Message(senderAddress, message,
          DateFormat("dd/MM/yyyy, hh:mm aa").format(DateTime.now())));
    });
  }

  void _receiveHandler() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    setState(() {
      isReceiving = true;
    });
    udpReceive(_myPort);
  }

  void _terminateHandler() {
    setState(() {
      isReceiving = false;
      _messages = [];
      _myPort = null;
    });
    udpReceiver.close();
    _formKey.currentState.reset();
  }

  //========================= Widget building =========================//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.blue[600],
              ),
              iconSize: 25.0,
              tooltip: "Send",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SenderPage()));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UDP Receiver",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(
                    thickness: 1.0,
                    height: 30.0,
                  ),
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: _buildHeadings("My Port: ")),
                  Row(
                    children: [
                      Expanded(child: _buildInputField()),
                      (isReceiving)
                          ? _buildButton("Stop", _terminateHandler)
                          : _buildButton("Receive", _receiveHandler),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          _buildHeadings("Messages: "),
                          isReceiving
                              ? Container(
                                  margin: EdgeInsets.only(left: 10),
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(),
                                )
                              : Container()
                        ],
                      )),
                  _buildMessageDisplay(),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Function onPressed) {
    return Container(
      width: 130,
      padding: EdgeInsets.all(10),
      child: OutlinedButton(
          onPressed: onPressed,
          child: Text(text, style: Theme.of(context).textTheme.button)),
    );
  }

  Widget _buildInputField() {
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
              hintText: 'My Port Number',
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              )),
              labelStyle: TextStyle(fontSize: 16)),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          validator: (String value) {
            if (!isNumeric(value)) {
              return 'Please enter a numerical Port Number';
            }
            return null;
          },
          onSaved: (String value) {
            _myPort = int.parse(value);
          }),
    );
  }

  Widget _buildHeadings(String text) {
    return Text(text, style: Theme.of(context).textTheme.headline2);
  }

  Widget _buildMessageDisplay() {
    if (_messages.length == 0) {
      return SizedBox.shrink();
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white60,
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(15)),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1.0,
              color: Colors.grey[300],
            );
          },
          shrinkWrap: true,
          reverse: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _messages.length,
          itemBuilder: (ctx, index) {
            return _buildMessageListTile(_messages[index]);
          },
        ),
      );
    }
  }
}

Widget _buildMessageListTile(Message msg) {
  return ListTile(
    title: Text(msg.data),
    subtitle: Text("IP: " + msg.senderAddress + "   Date: " + msg.dateTime),
  );
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null;
}
