import 'package:flutter/material.dart';
import 'package:ilia_flutter_challenge/theme/app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData(
      primaryColor: AppColors.darkMainAmber,
      scaffoldBackgroundColor: AppColors.darkScaffoldColor,
      brightness: Brightness.dark,
      useMaterial3: true);
}
