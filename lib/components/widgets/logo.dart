import 'package:flutter/material.dart';

///Displays the logo with a set width and height
class Logo extends StatelessWidget {
  final double width;
  final double height;

  const Logo({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png',
      width: width,
      height: height,
    );
  }
}
