import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/user_profile_card.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List<String> profilePictures = [
    'https://i.picsum.photos/id/1027/2848/4272.jpg?hmac=EAR-f6uEqI1iZJjB6-NzoZTnmaX0oI0th3z8Y78UpKM',
    'https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk',
    'https://i.picsum.photos/id/1035/5854/3903.jpg?hmac=DV0AS2MyjW6ddofvSIU9TVjj1kewfh7J3WEOvflY8TM',
  ];

  String nameAge = 'Maria Bently, 27';
  String job = 'Marketing Manager';
  String location = 'Lives in Manhattan, New York';
  String genderSexuality = 'Female, Straight';
  String company = 'Rockt consulting';
  String aboutMe =
      'I am a super nerd, I love computer, programming and SCI-FI TV shows. I am in love with all animals! Looking for someone I can game with :)';
  String lifeStyle =
      'Sleep, PROGRAMMING, WALKING MY 3 DOGS(MOST IMPORTANT) TV, SLEEP. That is my exciting lifestyle lol. And I game everynight before bed!';

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.background_color,
        body: SingleChildScrollView(
            child: Stack(children: [
          Column(
            children: [
              Container(
                width: _size.width,
                height: _size.height * 0.5,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return UserProfileCard(imageURL: profilePictures[index]);
                  },
                  itemCount: profilePictures.length,
                  pagination: SwiperPagination(margin: EdgeInsets.all(10)),
                  control: SwiperControl(color: Colors.transparent),
                ),
              ),
              SizedBox(
                height: _size.height * 0.02,
              ),

              // SizedBox(
              //   height: _size.height * 0.01,
              // ),
              Padding(
                  padding: EdgeInsets.all(_size.width * 0.02),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          nameAge,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _size.width * 0.07),
                        ),
                        SizedBox(width: _size.width * 0.02),
                        Icon(
                          Icons.verified,
                          color: Constants.neon_yellow,
                        )
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(_size.width * 0.02),
                child: Text(job,
                    style: TextStyle(
                        color: Constants.sky_blue,
                        fontSize: _size.width * 0.05)),
              ),
              //Verfied button
              Padding(
                padding: EdgeInsets.all(_size.width * 0.02),
                child: OutlinedGlowButton(
                    widget: Text(Constants.VERIFIED,
                        style: TextStyle(
                            color: Colors.white, fontSize: _size.width * 0.05)),
                    buttonWidth: _size.width * 0.35,
                    buttonHeight: _size.height * 0.06,
                    onPress: () {}),
              ),
              SizedBox(height: _size.height * 0.01),
              //Location
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: _size.width * 0.02,
                      horizontal: _size.width * 0.03),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.home,
                          color: Colors.grey[600],
                          size: _size.width * 0.07,
                        ),
                        SizedBox(width: _size.width * 0.03),
                        Text(
                          location,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _size.width * 0.045,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  )),
              //Job
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: _size.width * 0.02,
                      horizontal: _size.width * 0.03),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.briefcase,
                          color: Colors.grey[600],
                          size: _size.width * 0.07,
                        ),
                        SizedBox(width: _size.width * 0.03),
                        Text(
                          'Works at $job',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _size.width * 0.045,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  )),
              //Gender + Sexuality
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: _size.width * 0.02,
                      horizontal: _size.width * 0.03),
                  child: Center(
                    child: Row(
                      children: [
                        //TODO: Change depending if user is male or female
                        Icon(
                          Icons.male,
                          color: Colors.grey[600],
                          size: _size.width * 0.07,
                        ),
                        SizedBox(width: _size.width * 0.03),
                        Text(
                          genderSexuality,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _size.width * 0.045,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: _size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: _size.width * 0.02,
                    horizontal: _size.width * 0.03),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Constants.ABOUT_ME,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: _size.width * 0.07,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: _size.width * 0.02,
                    horizontal: _size.width * 0.04),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    aboutMe,
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: _size.width * 0.05,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: _size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: _size.width * 0.02,
                    horizontal: _size.width * 0.03),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Constants.LIFE_STYLE,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: _size.width * 0.07,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: _size.width * 0.02,
                    horizontal: _size.width * 0.04),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lifeStyle,
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: _size.width * 0.05,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: _size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: _size.width * 0.02,
                    horizontal: _size.width * 0.03),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color.fromARGB(255, 17, 17, 36),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //TODO:Copy wallet address
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: _size.width * 0.04,
                          horizontal: _size.width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share,
                            color: Constants.purple,
                            size: _size.width * 0.06,
                          ),
                          SizedBox(
                            width: _size.width * 0.02,
                          ),
                          Text(
                            Constants.SHARE_PROFILE_NOW,
                            style: TextStyle(
                                color: Constants.purple,
                                fontSize: _size.width * 0.05),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(_size.width * 0.01),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(CupertinoIcons.back,
                        color: Colors.white, size: _size.width * 0.07)),
              ),
              Padding(
                padding: EdgeInsets.all(_size.width * 0.01),
                child: OutlinedGlowButton(
                    widget: GradientText(
                      '95% Match',
                      gradient: LinearGradient(
                          colors: [Constants.sky_blue, Constants.pink]),
                      style: TextStyle(fontSize: _size.width * 0.05),
                    ),
                    buttonWidth: _size.width * 0.35,
                    buttonHeight: _size.height * 0.05,
                    onPress: () {}),
              )
            ],
          ),
        ])),
      ),
    );
  }
}
