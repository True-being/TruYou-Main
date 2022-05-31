import 'package:flutter/material.dart';
import 'package:truyou/components/widgets/back_button.dart';

///Builds the standard app bar with a white back button and title
AppBar customAppBar(
  BuildContext context,
  String backButtonKey,
  String title,
) {
  var theme = Theme.of(context);
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    leading: CustomBackButton(
      key: Key(backButtonKey),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: theme.textTheme.headline6
          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
    ),
  );
}
