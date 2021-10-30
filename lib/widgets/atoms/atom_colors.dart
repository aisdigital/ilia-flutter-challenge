import 'package:flutter/material.dart';

Map<int, Color> primaryTheMovieDbColor = {
  50: Color.fromRGBO(13, 37, 63, .1),
  100: Color.fromRGBO(13, 37, 63, .2),
  200: Color.fromRGBO(13, 37, 63, .3),
  300: Color.fromRGBO(13, 37, 63, .4),
  400: Color.fromRGBO(13, 37, 63, .5),
  500: Color.fromRGBO(13, 37, 63, .6),
  600: Color.fromRGBO(13, 37, 63, .7),
  700: Color.fromRGBO(13, 37, 63, .8),
  800: Color.fromRGBO(13, 37, 63, .9),
  900: Color.fromRGBO(13, 37, 63, 1),
};

Map<int, Color> secondaryTheMovieDbColor = {
  50: Color.fromRGBO(1, 180, 228, .1),
  100: Color.fromRGBO(1, 180, 228, .2),
  200: Color.fromRGBO(1, 180, 228, .3),
  300: Color.fromRGBO(1, 180, 228, .4),
  400: Color.fromRGBO(1, 180, 228, .5),
  500: Color.fromRGBO(1, 180, 228, .6),
  600: Color.fromRGBO(1, 180, 228, .7),
  700: Color.fromRGBO(1, 180, 228, .8),
  800: Color.fromRGBO(1, 180, 228, .9),
  900: Color.fromRGBO(1, 180, 228, 1),
};

Map<int, Color> tertiaryTheMovieDbColor = {
  50: Color.fromRGBO(144, 206, 161, .1),
  100: Color.fromRGBO(144, 206, 161, .2),
  200: Color.fromRGBO(144, 206, 161, .3),
  300: Color.fromRGBO(144, 206, 161, .4),
  400: Color.fromRGBO(144, 206, 161, .5),
  500: Color.fromRGBO(144, 206, 161, .6),
  600: Color.fromRGBO(144, 206, 161, .7),
  700: Color.fromRGBO(144, 206, 161, .8),
  800: Color.fromRGBO(144, 206, 161, .9),
  900: Color.fromRGBO(144, 206, 161, 1),
};

Map<int, Color> whiteMaterial = {
  50: Color.fromRGBO(255, 255, 255, .1),
  100: Color.fromRGBO(255, 255, 255, .2),
  200: Color.fromRGBO(255, 255, 255, .3),
  300: Color.fromRGBO(255, 255, 255, .4),
  400: Color.fromRGBO(255, 255, 255, .5),
  500: Color.fromRGBO(255, 255, 255, .6),
  600: Color.fromRGBO(255, 255, 255, .7),
  700: Color.fromRGBO(255, 255, 255, .8),
  800: Color.fromRGBO(255, 255, 255, .9),
  900: Color.fromRGBO(255, 255, 255, 1),
};

MaterialColor primaryColor = MaterialColor(0xff0d253f, primaryTheMovieDbColor);

MaterialColor secondaryColor =
    MaterialColor(0xff01b4e4, secondaryTheMovieDbColor);

MaterialColor tertiaryColor =
    MaterialColor(0xff90cea1, tertiaryTheMovieDbColor);
MaterialColor materialWhite = MaterialColor(0xffffffff, whiteMaterial);
