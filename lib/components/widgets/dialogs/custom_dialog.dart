import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:truyou/components/components.dart';

class CustomDialog {
  //Show platform specialized dialog
  static void showBasicDialog(
      BuildContext context, String title, String content, String route,
      [bool isDismissable = true]) {
    Size _size = MediaQuery.of(context).size;
    return Platform.isIOS
        ? _iosDialog(context, _size, title, content, route)
        : _androidDialog(context, _size, title, content, route);
  }
}

//Displays the iOS specific custom dialog
void _iosDialog(BuildContext context, Size size, String title, String content,
    String route) {
  showCupertinoDialog(
    routeSettings: RouteSettings(name: route),
    useRootNavigator: false,
    context: context,
    builder: (context) {
      return Theme(
        data: ThemeData.dark(),
        child: CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
                color: Colors.grey[400],
                fontSize: ResponsiveWidget.size(
                    context, size.width * 0.05, size.width * 0.025)),
          ),
          content: Text(
            content,
            style: TextStyle(
                color: Colors.grey[400],
                fontSize: ResponsiveWidget.size(
                    context, size.width * 0.04, size.width * 0.02)),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                Constants.OK,
                style: TextStyle(
                    color: Constants.sky_blue,
                    fontSize: ResponsiveWidget.size(
                        context, size.width * 0.04, size.width * 0.02)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    },
  );
}

//Displays the android specific custom dialog
void _androidDialog(
  BuildContext context,
  Size size,
  String title,
  String content,
  String route,
) {
  showDialog(
    routeSettings: RouteSettings(name: route),
    context: context,
    useRootNavigator: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Constants.background_color,
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveWidget.size(
                  context, size.width * 0.05, size.width * 0.025)),
        ),
        content: Text(
          content,
          style: TextStyle(
              color: Colors.grey[400],
              fontSize: ResponsiveWidget.size(
                  context, size.width * 0.04, size.width * 0.02)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              Constants.OK,
              style: TextStyle(
                  color: Constants.sky_blue,
                  fontSize: ResponsiveWidget.size(
                      context, size.width * 0.04, size.width * 0.02)),
            ),
          )
        ],
      );
    },
  );
}
