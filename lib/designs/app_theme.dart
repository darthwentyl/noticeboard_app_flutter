import 'package:flutter/material.dart';
import 'package:noticeboard/designs/app_colors.dart';

class AppTheme {
  static ThemeData build(BuildContext context) {
    return ThemeData(
      fontFamily: "Cabin",
      scaffoldBackgroundColor: AppColors.mainBackground,
    );
  }
}
