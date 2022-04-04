import 'package:flutter/material.dart';

import '../../components.dart';

///An outlined glow button has a border with the gradient surronding it
///It uses a container to create the border-like effect
class OutlinedGlowButton extends StatelessWidget {
  final Widget widget;
  final double buttonWidth;
  final double buttonHeight;
  final double? verticalPadding;
  final double? horizontalPadding;
  final LinearGradient? gradient;
  final Color? glowColor;
  final Function() onPress;

  const OutlinedGlowButton(
      {Key? key,
      required this.widget,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.onPress,
      this.verticalPadding,
      this.horizontalPadding,
      this.gradient,
      this.glowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? _size.height * 0.015,
              horizontal: horizontalPadding ?? _size.width * 0.03),
          child: Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color:
                      glowColor?.withAlpha(70) ?? Constants.pink.withAlpha(70),
                  blurRadius: 12.0,
                  spreadRadius: 0.0,
                  offset: Offset(
                    0.0,
                    3.0,
                  ),
                ),
              ],
              gradient: gradient ??
                  LinearGradient(
                    colors: [Constants.sky_blue, Constants.pink],
                  ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Constants.background_color),
              margin: EdgeInsets.all(2.0),
              child: OutlinedButton(
                onPressed: () {
                  onPress.call();
                },
                style: OutlinedButton.styleFrom(),
                child: widget,
              ),
            ),
          ),
        ));
  }
}
