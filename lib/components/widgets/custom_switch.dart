import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:truyou/components/components.dart';

class CSwitch extends StatelessWidget {
  final Function(bool) active;

  CSwitch({Key? key, required this.active}) : super(key: key);

  var status = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setstate) {
      return FlutterSwitch(
        width: w(context, 40),
        height: h(context, 7),
        value: status,
        padding: 1.0,
        activeColor: Constants.pink,
        inactiveColor: Constants.medium_blue,
        borderRadius: 30.0,
        onToggle: (val) {
          setstate(() {
            status = val;
            active.call(val);
          });
        },
      );
    });
  }
}
