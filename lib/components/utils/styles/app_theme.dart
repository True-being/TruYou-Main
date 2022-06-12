import 'package:flutter/material.dart';

ThemeData buildAppTheme(BuildContext context) {
  final defaultTheme = Theme.of(context);

  return ThemeData(textTheme: _buildTextTheme(context, defaultTheme.textTheme));
}

TextTheme _buildTextTheme(BuildContext context, TextTheme theme) {
  var t = TextStyle(fontFamily: 'GothamRounded');
  return TextTheme(
      headline1: (theme.headline1 ?? t).copyWith(
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      headline2: (theme.headline2 ?? t)
          .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
      headline3:
          (theme.headline3 ?? t).copyWith(color: Colors.white, fontSize: 22),
      headline4: (theme.headline4 ?? t).copyWith(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
      headline5: (theme.headline5 ?? t).copyWith(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      headline6: (theme.headline6 ?? t).copyWith(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),
      button: (theme.button ?? t).copyWith(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400));
}
