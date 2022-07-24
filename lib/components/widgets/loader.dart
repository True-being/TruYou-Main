import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 100,
      height: 100,
      child: RiveAnimation.asset(
        'assets/loading_animation.riv',
      ),
    ));
  }
}

class TransparentLoader extends StatelessWidget {
  const TransparentLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 100,
      height: 100,
      child: RiveAnimation.asset(
        'assets/loading_animation_trans.riv',
      ),
    ));
  }
}

class OverlayLoader {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey<State> key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.transparent,
                  children: <Widget>[Center(child: TransparentLoader())]));
        });
  }

  static void pop(GlobalKey<State> key) {
    if (key.currentContext != null) {
      return Navigator.of(key.currentContext!).pop();
    }
  }
}
