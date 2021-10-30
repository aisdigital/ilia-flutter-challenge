import 'package:flutter/material.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';

MaterialColor getColorProgress(average) {
  if (average > 0.75) {
    return tertiaryColor;
  }
  if (average > 0.5) {
    return secondaryColor;
  }

  if (average <= 0.5) {
    return Colors.red;
  } else {
    return primaryColor;
  }
}
