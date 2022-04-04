import 'package:flutter/material.dart';

class ResponsiveWidget {
  //Small screen is any screen whose width is less than 800 pixels
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  //Large screen is any screen whose width is more than 1200 pixels
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  //Sets size based on screen size
  static double size(BuildContext context, double small, double large) {
    return isSmallScreen(context)
        ? small
        : isLargeScreen(context)
            ? large
            : large;
  }
}
