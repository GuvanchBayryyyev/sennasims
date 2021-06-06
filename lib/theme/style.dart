import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black),
      inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: 15,
        ),
        isDense: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(112, 112, 112, 1)),
        ),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(112, 112, 112, 1)),
        ),
      ));
}
