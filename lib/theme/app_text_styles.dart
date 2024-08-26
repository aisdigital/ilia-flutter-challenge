import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilia_flutter_challenge/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle appBarTitle = GoogleFonts.inter(
    fontSize: 16,
    color: AppColors.darkMainText,
    fontWeight: FontWeight.w400,
  );
  static TextStyle movieDetailsTitle = GoogleFonts.inter(
    fontSize: 28,
    color: AppColors.darkMainText,
    fontWeight: FontWeight.w700,
  );
  static TextStyle movieDetailsAverageVote = GoogleFonts.inter(
    fontSize: 14,
    color: AppColors.darkTertiaryText,
    fontWeight: FontWeight.w500,
  );
  static TextStyle movieDetailsOverview = GoogleFonts.inter(
    fontSize: 14,
    color: AppColors.darkTertiaryText,
    fontWeight: FontWeight.w400,
  );
  static TextStyle movieDetailsReleaseYear = GoogleFonts.inter(
    fontSize: 12,
    color: AppColors.darkSecondaryText,
    fontWeight: FontWeight.w600,
  );
  static TextStyle button = GoogleFonts.inter(
    fontSize: 16,
    color: AppColors.darkMainText,
    fontWeight: FontWeight.w700,
  );
}
