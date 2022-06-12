import 'package:flutter/material.dart';
import 'package:truyou/components/utils/constants/constants.dart';

///Displays gradient text with a defined gradient
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.textAlign,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(
          foreground: Paint()
            ..shader = LinearGradient(
              colors: <Color>[
                Constants.sky_blue,
                Constants.pink,
                //add more color here.
              ],
            ).createShader(
              Rect.fromLTWH(0.0, 0.0, 300.0, 70.0),
            )),
      textAlign: textAlign,
    );
  }
}
