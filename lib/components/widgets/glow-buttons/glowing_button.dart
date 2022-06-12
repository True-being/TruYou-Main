import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

///A full glow button is filled with the specific gradient
class GlowButton extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final double buttonHeight;
  final double? verticalPadding;
  final double? horizontalPadding;
  final List<Color>? gradients;
  final bool? centerAlign;
  final double? fontSize;
  final double? borderRadius;
  final Function() onPress;

  const GlowButton(
      {Key? key,
      required this.text,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.onPress,
      this.borderRadius,
      this.fontSize,
      this.verticalPadding,
      this.horizontalPadding,
      this.gradients,
      this.centerAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    final _child = Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
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
          colors: gradients ?? [Constants.sky_blue, Constants.pink],
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
              fontSize: fontSize ??
                  ResponsiveWidget.size(
                      context, _size.width * 0.055, _size.width * 0.022),
              fontWeight: FontWeight.w500),
        ),
      ),
    );

    Widget _buildChild() {
      if (centerAlign != null) {
        return _child;
      } else {
        return Center(child: _child);
      }
    }

    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? _size.height * 0.015,
            horizontal: horizontalPadding ?? _size.width * 0.03),
        child: _buildChild());
  }
}
