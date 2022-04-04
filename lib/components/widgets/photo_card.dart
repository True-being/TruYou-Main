import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

///Photo select card - Select a photo(max 6) for your display photos
class PhotoCard extends StatelessWidget {
  final File? image;
  final Function onPressed;
  const PhotoCard({Key? key, required this.image, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    if (image != null) {
      //Displays image from gallery
      return GestureDetector(
          onTap: () {
            onPressed.call();
          },
          child: Padding(
            padding: EdgeInsets.all(ResponsiveWidget.size(
              context,
              _size.width * 0.02,
              _size.width * 0.01,
            )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: FileImage(image!), fit: BoxFit.cover)),
            ),
          ));
    } else {
      //Displays container and add icon
      return Padding(
        padding: EdgeInsets.all(ResponsiveWidget.size(
          context,
          _size.width * 0.02,
          _size.width * 0.01,
        )),
        child: GestureDetector(
          onTap: () {
            onPressed.call();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey[900]),
            child: Center(
                child: Icon(
              CupertinoIcons.add,
              size: ResponsiveWidget.size(
                  context, _size.width * 0.07, _size.width * 0.04),
              color: Constants.sky_blue,
            )),
          ),
        ),
      );
    }
  }
}
