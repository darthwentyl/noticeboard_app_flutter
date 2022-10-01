import 'package:flutter/cupertino.dart';

class SizeGetter {
  static width(BuildContext context, double fillPercentage) {
    return MediaQuery.of(context).size.width * (fillPercentage / 100.0);
  }

  static height(BuildContext context, double fillPercentage) {
    return MediaQuery.of(context).size.height * (fillPercentage / 100.0);
  }
}
