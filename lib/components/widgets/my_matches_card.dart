import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

class MyMatchesCard extends StatelessWidget {
  final String imageURL;
  final int matchPerc;
  final String name;
  final String age;
  final String location;
  final String aboutMe;
  const MyMatchesCard(
      {Key? key,
      required this.imageURL,
      required this.matchPerc,
      required this.name,
      required this.age,
      required this.location,
      required this.aboutMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(_size.width * 0.025),
      child: GestureDetector(
        onTap: () {
          CustomDialog.showMatchOptionDialog(context, name);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: new NetworkImage(imageURL), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(_size.width * 0.02),
                  child: Container(
                      width: _size.width * 0.2,
                      height: _size.height * 0.04,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Constants.background_color),
                      child: Center(
                        child: GradientText('$matchPerc% match',
                            gradient: LinearGradient(
                                colors: [Constants.sky_blue, Constants.pink]),
                            style: TextStyle(
                                fontSize: _size.width * 0.03,
                                fontWeight: FontWeight.w500)),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(_size.width * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: _size.width * 0.01),
                        child: Text(
                          name + age,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _size.width * 0.04,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: _size.width * 0.01),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: _size.width * 0.035,
                              ),
                              SizedBox(
                                width: _size.width * 0.005,
                              ),
                              Text(
                                location,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _size.width * 0.03,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          )),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: _size.width * 0.01),
                        child: Text(
                          aboutMe,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: _size.width * 0.025,
                              fontWeight: FontWeight.w300,
                              overflow: TextOverflow.ellipsis),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
