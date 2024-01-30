import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/infra/services/theme/ilia_palette.dart'
    show FontPalette;

class LightTheme {
  LightTheme(this.context);
  final BuildContext context;

  TextScaler get textScaler => MediaQuery.textScalerOf(context);

  static Color seed = const Color(0XFFBFDBF7);

  ThemeData themeData() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seed,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            color: FontPalette.fontDark2,
            fontWeight: FontWeight.w500,
            fontSize: textScaler.scale(26),
          ),
          headlineMedium: TextStyle(
            color: FontPalette.fontDark2,
            fontWeight: FontWeight.w500,
            fontSize: textScaler.scale(30),
          ),
          headlineLarge: TextStyle(
            color: FontPalette.fontDark2,
            fontWeight: FontWeight.w500,
            fontSize: textScaler.scale(34),
          ),
          titleSmall: TextStyle(
            color: FontPalette.fontDark1,
            fontWeight: FontWeight.w600,
            fontSize: textScaler.scale(16),
          ),
          titleMedium: TextStyle(
            color: FontPalette.fontDark1,
            fontWeight: FontWeight.w600,
            fontSize: textScaler.scale(20),
          ),
          titleLarge: TextStyle(
            color: FontPalette.fontDark1,
            fontWeight: FontWeight.w600,
            fontSize: textScaler.scale(24),
          ),
          bodySmall: TextStyle(
            color: FontPalette.fontDark2,
            fontWeight: FontWeight.w500,
            fontSize: textScaler.scale(16),
          ),
          bodyMedium: TextStyle(
            color: FontPalette.fontDark2,
            fontWeight: FontWeight.w500,
            fontSize: textScaler.scale(18),
          ),
          bodyLarge: TextStyle(
            color: FontPalette.fontDark2,
            fontWeight: FontWeight.w500,
            fontSize: textScaler.scale(20),
          ),
          displaySmall: TextStyle(
            color: FontPalette.fontDark2,
            fontSize: textScaler.scale(18),
          ),
          displayMedium: TextStyle(
            color: FontPalette.fontDark2,
            fontSize: textScaler.scale(22),
          ),
          displayLarge: TextStyle(
            color: FontPalette.fontDark2,
            fontSize: textScaler.scale(26),
          ),
        ),
      );
}
