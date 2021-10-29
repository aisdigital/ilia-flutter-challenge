import 'package:flutter/material.dart';

Map<int, Color> primaryTheMovieDbColor = {
  50: Color.fromRGBO(13, 36, 63, .1),
  100: Color.fromRGBO(13, 36, 63, .2),
  200: Color.fromRGBO(13, 36, 63, .3),
  300: Color.fromRGBO(13, 36, 63, .4),
  400: Color.fromRGBO(13, 36, 63, .5),
  500: Color.fromRGBO(13, 36, 63, .6),
  600: Color.fromRGBO(13, 36, 63, .7),
  700: Color.fromRGBO(13, 36, 63, .8),
  800: Color.fromRGBO(13, 36, 63, .9),
  900: Color.fromRGBO(13, 36, 63, 1),
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

MaterialColor primaryColor = MaterialColor(0xff133663, primaryTheMovieDbColor);
MaterialColor materialWhite = MaterialColor(0xffffffff, whiteMaterial);
