import 'package:flutter/material.dart';
import 'package:illiamovieapp/app/core/style/movie_app_color.dart';

abstract class MovieAppTheme {
  MovieAppTheme._();

  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        background: MovieAppColors.blueGrey.shade900,
        error: MovieAppColors.red,
        onBackground: MovieAppColors.white,
        onError: MovieAppColors.black,
        onPrimary: MovieAppColors.black,
        onSecondary: MovieAppColors.black,
        onSurface: MovieAppColors.white,
        primary: MovieAppColors.blueLight,
        primaryVariant: MovieAppColors.blueLight,
        secondary: MovieAppColors.blueLight,
        secondaryVariant: MovieAppColors.blueLight,
        surface: MovieAppColors.blueGrey.shade800,
      ),
      dialogBackgroundColor: MovieAppColors.blueGrey.shade50,
      disabledColor: MovieAppColors.white.withOpacity(.12),
      appBarTheme: AppBarTheme(
        backgroundColor: MovieAppColors.blueGrey.shade500,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: MovieAppColors.blueGrey.shade300,
      ),
    );
  }
}
