import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

class ColorChip extends StatelessWidget {
  final Color color;
  const ColorChip({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w(context, 30),
      height: w(context, 7),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
