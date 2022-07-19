import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

class NoMoreUsers extends StatelessWidget {
  const NoMoreUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Text(
        Constants.NO_MORE_USERS_MESSAGE,
        textAlign: TextAlign.center,
        style: theme.textTheme.headline3?.copyWith(color: Colors.white),
      ),
    );
  }
}
