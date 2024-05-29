import 'package:flutter/material.dart' show Size, BuildContext, MediaQuery, Orientation;

class GlobalMediaQuery {
  static double? screenWidth;
  static double? screenHeight;
  static Size? _mediaQuerySize;
  static Orientation? orientation;

  static void init(BuildContext context) {
    _mediaQuerySize = MediaQuery.sizeOf(context);

    screenWidth = _mediaQuerySize?.width;
    screenHeight = _mediaQuerySize?.height;

    orientation = MediaQuery.orientationOf(context);
  }
}
