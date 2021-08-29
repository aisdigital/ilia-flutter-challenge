import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get themeData {
    final themeApp = ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.blue,
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
    );
    return themeApp;
  }
}
