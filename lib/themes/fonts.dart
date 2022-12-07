import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oriontek_flutter/themes/colors.dart';

class AppFonts {
  static TextStyle tinyText = GoogleFonts.nunito(
    fontSize: 8,
    color: AppColors.appText,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textSmall = GoogleFonts.nunito(
    fontSize: 10,
    color: AppColors.appText,
  );

  static TextStyle normalText = GoogleFonts.nunito(
    fontSize: 12,
    color: AppColors.appText,
  );

  static TextStyle textBig = GoogleFonts.nunito(
    fontSize: 14,
    color: AppColors.appText,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textBig2 = GoogleFonts.nunito(
      fontSize: 16, color: AppColors.appText, fontWeight: FontWeight.w600);
  static TextStyle largeText = GoogleFonts.nunito(
    fontSize: 18,
    color: AppColors.appText,
    fontWeight: FontWeight.bold,
  );
  static TextStyle largeText2 = GoogleFonts.nunito(
    fontSize: 20,
    color: AppColors.appText,
    fontWeight: FontWeight.bold,
  );
  static TextStyle hugeText = GoogleFonts.nunito(
    fontSize: 22,
    color: AppColors.appText,
    fontWeight: FontWeight.bold,
  );
  static TextStyle hugeText2 = GoogleFonts.raleway(
    fontSize: 26,
    color: AppColors.appText,
    fontWeight: FontWeight.w900,
  );

  static TextStyle extraBoldText = GoogleFonts.raleway(
    fontSize: 26,
    color: AppColors.appText,
    fontWeight: FontWeight.w800,
  );
}
