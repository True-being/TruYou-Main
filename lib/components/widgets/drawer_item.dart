import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function onPressed;

  const DrawerItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: _size.width * 0.03, horizontal: _size.width * 0.01),
        child: Row(children: [
          Padding(
            padding: EdgeInsets.all(_size.width * 0.02),
            child: Icon(
              icon.icon,
              color: Colors.white,
              size: _size.width * 0.07,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_size.width * 0.02),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: _size.width * 0.05,
                  fontWeight: FontWeight.w600),
            ),
          )
        ]),
      ),
    );
  }
}
