import 'package:flutter/material.dart';

final kThemeData = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.purple,
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
);
