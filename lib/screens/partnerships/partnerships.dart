import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

class Partnerships extends StatelessWidget {
  const Partnerships({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.background_color,
      body: Center(
          child: Text(
        Constants.COMING_SOON,
        style: theme.textTheme.headline2?.copyWith(color: Colors.red),
      )),
    );
  }
}
