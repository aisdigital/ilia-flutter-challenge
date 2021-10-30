import 'package:flutter/material.dart';
import 'package:ilia_challenge/util/util_color.dart';
import 'package:ilia_challenge/widgets/atoms/atom_colors.dart';

CircularProgressIndicator buildCircularProgressIndicatorColored(voteAverage) {
  var average = double.parse(voteAverage.toString()) / 10;
  return CircularProgressIndicator(
    backgroundColor: primaryColor,
    valueColor: AlwaysStoppedAnimation<Color>(getColorProgress(average)),
    value: average,
  );
}
