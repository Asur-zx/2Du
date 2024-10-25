import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.black,
      onPrimary: AppColors.white,
      secondary: AppColors.gray,
      onSecondary: AppColors.palewhite,
      surface: AppColors.black,
      onSurface: AppColors.white,
      error: AppColors.red,
      onError: AppColors.red
  ),
);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.white,
      onPrimary: AppColors.black,
      secondary: AppColors.palewhite,
      onSecondary: AppColors.gray,
      surface: AppColors.white,
      onSurface: AppColors.black,
      error: AppColors.red,
      onError: AppColors.red
  ),
);