import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static Icon home = const Icon(Icons.home_outlined);
  static Icon add = const Icon(Icons.add_outlined);
  static Icon person = const Icon(Icons.person);
  static Icon bell = const Icon(
    IconData(0xF3E1,
        fontFamily: CupertinoIcons.iconFont,
        fontPackage: CupertinoIcons.iconFontPackage),
    size: 20.0,
  );
}
