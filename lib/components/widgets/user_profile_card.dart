import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String imageURL;

  const UserProfileCard({Key? key, required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                imageURL,
              ),
              fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: _size.width,
          height: _size.height * 0.3,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.white.withOpacity(0.4),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
      ),
    );
  }
}
