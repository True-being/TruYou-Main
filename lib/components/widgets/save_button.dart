import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: p(context, 8.0), horizontal: p(context, 16.0)),
      child: Container(
        width: size.width,
        height: h(context, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Constants.pink,
        ),
        child: Center(
            child: Text(
          Constants.SAVE,
          style: theme.textTheme.headline2?.copyWith(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
