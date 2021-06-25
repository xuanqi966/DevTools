import 'package:flutter/material.dart';

ThemeData basicTheme() {
  final base = ThemeData.light();

  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1.copyWith(
            fontFamily: 'Raleway-Bold',
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        headline2: base.headline2.copyWith(
            fontFamily: 'Raleway-Bold',
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        headline3: base.headline3.copyWith(
            // card headline
            fontFamily: 'Raleway-Bold',
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        bodyText1: base.bodyText1.copyWith(
            // normal body
            fontFamily: 'Raleway-Regular',
            fontSize: 16,
            color: Colors.black),
        bodyText2: base.bodyText2.copyWith(
            // card body
            fontFamily: 'Raleway-Regular',
            fontSize: 12,
            color: Colors.grey),
        button: base.button.copyWith(
            fontFamily: 'Raleway-Regular', fontSize: 16, color: Colors.white),
        caption: base.caption.copyWith(
            // pull down list
            fontFamily: 'Raleway-Regular',
            fontSize: 16,
            color: Colors.grey));
  }

  AppBarTheme _basicAppBarTheme(AppBarTheme base) {
    return base.copyWith(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.blue[600],
          size: 25,
        ));
  }

  OutlinedButtonThemeData _basicOutlinedbuttonTheme() {
    return OutlinedButtonThemeData(
        style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      minimumSize: MaterialStateProperty.all(Size.fromHeight(40)),
      // backgroundColor:  MaterialStateProperty.all(Colors.blue[600]),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.blue[800];
        } else {
          return Colors.blue[600];
        }
      }),
      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)))),
    ));
  }

  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      appBarTheme: _basicAppBarTheme(base.appBarTheme),
      outlinedButtonTheme: _basicOutlinedbuttonTheme());
}
