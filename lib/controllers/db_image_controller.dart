import 'dart:math';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class DbImageController {
  getImage(String url) {
    // TODO: it should be taken from db
    if (Random().nextBool()) {
      if (url.split('.').last == "png") {
        return Container(
          color: Colors.red,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image(
              image: AssetImage(url),
              fit: BoxFit.fill,
            ),
          ),
        );
      } else {
        return Container(
          color: Colors.red,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: SvgPicture.asset(
              url,
            ),
          ),
        );
      }
    }
    return null;
  }
}
