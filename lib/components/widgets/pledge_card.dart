import 'package:flutter/material.dart';

class PledgeCard extends StatelessWidget {
  final Color color;
  final Widget child;
  const PledgeCard({Key? key, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(_size.width * 0.02),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: color,
            boxShadow: [
              BoxShadow(
                color: color.withAlpha(60),
                blurRadius: 6.0,
                spreadRadius: 3.0,
                offset: Offset(
                  0.0,
                  0.0,
                ),
              ),
            ]),
        margin: EdgeInsets.all(_size.width * 0.06),
        child: child,
      ),
    );
  }
}
