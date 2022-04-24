import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          CupertinoIcons.back,
          color: Colors.white,
          size: _size.width * 0.07,
        ));
  }
}
