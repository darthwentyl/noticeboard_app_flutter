import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';

class AppTheme {
  static ThemeData build(BuildContext context) {
    return ThemeData(
      fontFamily: "Cabin",
      scaffoldBackgroundColor: AppColors.mainBackground,
    );
  }
}

class BoxTheme {
  static const double radius = 11.0;
}

class CustomTextTheme {
  static TextStyle textStyle() {
    return const TextStyle(fontSize: 16.0, color: AppColors.customWhite);
  }
}
