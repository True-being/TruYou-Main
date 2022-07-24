import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MatchAnimation extends StatelessWidget {
  const MatchAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 300,
      child: RiveAnimation.asset(
        'assets/match_animation.riv',
      ),
    ));
  }
}
