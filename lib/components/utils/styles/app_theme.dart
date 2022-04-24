import 'package:flutter/material.dart';

ThemeData buildAppTheme(BuildContext context) {
  final defaultTheme = Theme.of(context);

  return ThemeData(textTheme: _buildTextTheme(defaultTheme.textTheme));
}

TextTheme _buildTextTheme(TextTheme t) {
  return TextTheme();
}
