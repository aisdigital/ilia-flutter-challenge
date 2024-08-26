import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF333333),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
        color: Color(0xFFFFFFFF),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        surfaceTintColor: Colors.white),
    textTheme: lightTextTheme,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      contentPadding: EdgeInsets.all(18),
      outlineBorder: BorderSide(color: Color(0xFFEEEEEE)),
      fillColor: Color(0xFFEEEEEE),
      labelStyle: TextStyle(
        color: Color(0xff79787D),
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      hintStyle: TextStyle(
        color: Color(0xFF59585E),
      ),
      alignLabelWithHint: false,
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: const Color(0xffFFFFFF),
    scaffoldBackgroundColor: const Color(0xff151515),
    textTheme: darkTextTheme,
  );
}

final lightTextTheme = TextTheme(
  bodyLarge: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xff333333),
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const Color(0xff555555),
  ),
  bodySmall: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xff777777),
  ),
  titleLarge: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: const Color(0xff333333),
  ),
  titleMedium: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xff444444),
  ),
  titleSmall: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color(0xff555555),
  ),
  headlineMedium: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: const Color(0xff333333),
  ),
  headlineSmall: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xff444444),
  ),
  displayMedium: GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: const Color(0xff222222),
  ),
  displaySmall: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: const Color(0xff333333),
  ),
);

final darkTextTheme = TextTheme(
  bodyLarge: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xfff1f1f1),
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const Color(0xffe1e1e1),
  ),
  bodySmall: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xffc1c1c1),
  ),
  titleLarge: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: const Color(0xfff1f1f1),
  ),
  titleMedium: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xffe1e1e1),
  ),
  titleSmall: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color(0xffd1d1d1),
  ),
  headlineMedium: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: const Color(0xfff1f1f1),
  ),
  headlineSmall: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xffe1e1e1),
  ),
  displayMedium: GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: const Color(0xfff1f1f1),
  ),
  displaySmall: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: const Color(0xffe1e1e1),
  ),
);
