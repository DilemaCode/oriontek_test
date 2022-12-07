import 'package:flutter/material.dart';
import 'package:oriontek_flutter/themes/colors.dart';

final ThemeData suiviTheme = ThemeData(
  backgroundColor: AppColors.whiteText,
  scaffoldBackgroundColor: AppColors.whiteText,
  // backgroundColor: AppColors.background,
  primaryColor: AppColors.secondary,
  dividerTheme: DividerThemeData(),
  colorScheme: ColorScheme.light().copyWith(
    primary: AppColors.secondary,
    background: AppColors.whiteText,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.secondary,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondary),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondary),
    ),
  ),
);
