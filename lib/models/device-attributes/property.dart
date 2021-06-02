import 'package:flutter/material.dart';

class Property {
  final ImageIcon icon;
  final String propertyTitle;
  final String property1;
  String property2; // optional

  Property(this.icon, this.propertyTitle, this.property1, [this.property2]);
}
