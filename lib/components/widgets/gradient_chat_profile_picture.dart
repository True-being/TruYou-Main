import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

//User Profile picture
BoxDecoration innerDecoration(String imageURL) {
  //TODO: Change to network image
  return BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(image: AssetImage(imageURL)),
  );
}

//Border
BoxDecoration outlineDecoration() {
  return BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(colors: [Constants.sky_blue, Constants.pink]),
  );
}

//Create a profile picture with a gradient border around it
class GradientChatProfilePicture extends StatelessWidget {
  final String imageURL;

  const GradientChatProfilePicture({Key? key, required this.imageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipBehavior: Clip.antiAlias,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(2.0), //width of the border
          child: ClipOval(
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: w(context, 75),
              height: w(context, 75),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(imageURL), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        decoration: outlineDecoration(),
      ),
    );
  }
}
