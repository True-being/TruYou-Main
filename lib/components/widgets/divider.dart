import 'package:flutter/material.dart';

///Creates a grey horizontal divider line for seperation of areas
class CDivider extends StatelessWidget {
  final Color? color;
  final double? width;

  const CDivider({Key? key, this.color, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Colors.grey[800]?.withOpacity(0.5),
      thickness: 1.0,
      height: width ?? 2,
    );
  }
}
