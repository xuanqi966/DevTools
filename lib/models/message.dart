import 'dart:io';

class Message {
  final String senderAddress;
  final String data;
  final String dateTime;

  Message(this.senderAddress, this.data, this.dateTime);
}
