import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

///Card element in a swipable deck of cards
///Used to store users who may be a potential match
///Profile picture, career and general information
class SwipeCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const SwipeCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.8,
      height: _size.height * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          )),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: _size.width,
              height: _size.height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
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
          Padding(
            padding: EdgeInsets.only(bottom: _size.height * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: _size.height * 0.02),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ResponsiveWidget.size(
                              context, _size.width * 0.07, _size.width * 0.04)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: _size.height * 0.01,
                        horizontal: _size.height * 0.02),
                    child: Text(
                      description,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ResponsiveWidget.size(
                              context, _size.width * 0.04, _size.width * 0.03)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
