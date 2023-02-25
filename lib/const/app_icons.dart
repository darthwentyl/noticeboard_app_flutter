import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';

class AppIcons {
  static Icon home = const Icon(Icons.home_outlined);
  static Icon add = const Icon(Icons.add_outlined);
  static Icon person = const Icon(Icons.person);
  static Icon bell = const Icon(
    IconData(0xF3E1,
        fontFamily: CupertinoIcons.iconFont,
        fontPackage: CupertinoIcons.iconFontPackage),
    size: 24.0,
  );
  static const Icon heart = const Icon(
    IconData(0xf443,
        fontFamily: CupertinoIcons.iconFont,
        fontPackage: CupertinoIcons.iconFontPackage),
  );
  static const Icon comment = const Icon(
    IconData(0xe3f2, fontFamily: 'MaterialIcons'),
    color: AppColors.customBlue,
  );
  static const Icon trash = const Icon(
    IconData(0xf4c4,
        fontFamily: CupertinoIcons.iconFont,
        fontPackage: CupertinoIcons.iconFontPackage),
  );
  static const Icon diamond = const Icon(
    IconData(0xf05e7, fontFamily: 'MaterialIcons'),
    color: Color(0xFFFFD700),
  );
}
