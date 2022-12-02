import 'dart:math';

import 'package:flutter_svg/svg.dart';

class DbImageController {
  getImage(String url) {
    // TODO: it should be taken from db
    if (Random().nextBool()) {
      return SvgPicture.asset(
        url,
      );
    }
    return null;
  }
}
