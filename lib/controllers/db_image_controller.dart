import 'dart:math';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class DbImageController {
  getImage(String url) {
    // TODO: it should be taken from db
    if (Random().nextBool()) {
      if (url.split('.').last == "png") {
        return Image.asset(
          url,
        );
      } else {
        return SvgPicture.asset(
          url,
        );
      }
    }
    return null;
  }
}
