import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

///A full glow button is filled with the specific gradient
class GlowButton extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final double buttonHeight;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Function() onPress;

  const GlowButton(
      {Key? key,
      required this.text,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.onPress,
      this.verticalPadding,
      this.horizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? _size.height * 0.015,
          horizontal: horizontalPadding ?? _size.width * 0.03),
      child: Center(
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Constants.pink.withAlpha(70),
                blurRadius: 12.0,
                spreadRadius: 0.0,
                offset: Offset(
                  0.0,
                  3.0,
                ),
              ),
            ],
            gradient: LinearGradient(
              colors: [Constants.sky_blue, Constants.pink],
            ),
          ),
          child: OutlinedButton(
            onPressed: () {
              onPress.call();
            },
            style: OutlinedButton.styleFrom(),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveWidget.size(
                      context, _size.width * 0.055, _size.width * 0.022),
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
