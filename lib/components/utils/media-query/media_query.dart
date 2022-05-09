import 'package:flutter/material.dart';

const double magicWidthConstant = 0.0025;
const double magicHeightConstant = 0.004;
const double magicFontConstant = 0.0025;
const double magicPaddingConstant = 0.0024;

///Returns the screen width
double sWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

///Returns the screen height
double sHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///Width media query function
///Uses context to query screen size
///ss -> Standard size ; This is the standard size flutter measurements
double w(BuildContext context, double ss) {
  double width = MediaQuery.of(context).size.width;
  return width * (ss * magicWidthConstant);
}

///Height media query function
///Uses context to query screen size
///ss -> Standard size; This is the standard size flutter measurements
double h(BuildContext context, double ss) {
  double height = MediaQuery.of(context).size.height;
  return height * (ss * magicHeightConstant);
}

///Font size query function
///Uses context to query screen size
///ss -> Standard size ; This is the standard size flutter measurements
double f(BuildContext context, double ss) {
  double width = MediaQuery.of(context).size.width;
  return width * (ss * magicFontConstant);
}

///Padding query function
///Uses context to query screen size
///ss -> Standard size ; This is the standard size flutter measurements
double p(BuildContext context, double ss) {
  double width = MediaQuery.of(context).size.width;
  return width * (ss * magicFontConstant);
}

class SpacerV {
  ///Small vertical spacer
  static SizedBox s(BuildContext context) => SizedBox(height: h(context, 4));

  ///Medium vertical spacer
  static SizedBox m(BuildContext context) => SizedBox(height: h(context, 8));

  ///Large vertical spacer
  static SizedBox l(BuildContext context) => SizedBox(height: h(context, 16));

  ///Extra large vertical spacer
  static SizedBox xl(BuildContext context) => SizedBox(height: h(context, 32));

  ///Custom vertical spacer - by custom height(ss)
  static SizedBox c(BuildContext context, double c) =>
      SizedBox(height: h(context, c));
}
