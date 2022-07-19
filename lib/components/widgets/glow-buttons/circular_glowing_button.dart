import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

///A circular glow button used for Match options
class CircularGlowButton extends StatelessWidget {
  final double width;
  final double height;
  final double iconSize;
  final Icon icon;
  final Color iconColor;
  final Function onPress;
  final EdgeInsets? padding;
  const CircularGlowButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.iconSize,
      required this.icon,
      required this.iconColor,
      required this.onPress,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
              vertical: _size.height * 0.04, horizontal: _size.height * 0.02),
      child: GestureDetector(
        onTap: () {
          onPress.call();
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: iconColor.withAlpha(60),
                blurRadius: 6.0,
                spreadRadius: 3.0,
              )
            ],
            color: Colors.grey[900],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: GlowIcon(
              icon.icon,
              color: iconColor,
              glowColor: iconColor.withOpacity(0.7),
              blurRadius: 5,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
