import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/user_profile_card.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  //Dummy data
  List<String> profilePictures = [
    'https://i.picsum.photos/id/1005/5760/3840.jpg?hmac=2acSJCOwz9q_dKtDZdSB-OIK1HUcwBeXco_RMMTUgfY',
    'https://i.picsum.photos/id/1027/2848/4272.jpg?hmac=EAR-f6uEqI1iZJjB6-NzoZTnmaX0oI0th3z8Y78UpKM',
    'https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk',
    'https://i.picsum.photos/id/1035/5854/3903.jpg?hmac=DV0AS2MyjW6ddofvSIU9TVjj1kewfh7J3WEOvflY8TM',
  ];

  String nameAge = 'Tony Stark, 24';
  String job = 'Snr. Developer';
  String location = 'Lives in Manhattan, New York';
  String genderSexuality = 'Male, Straight';
  String company = 'Ryte Ltd.';
  String walletAddress =
      'HVU249TY49G72Y4G8724Y9GYG4928YG98Y289G8924H9VFNJ2489GYU2984HGJ92';
  String aboutMe =
      'I am a passionate programmer who loves star trek. I love dogs and love taking long walks in my spare time';
  String lifeStyle =
      'I am all about that Netflix and chill lifestyle when I am not typing away... Rick and Morty is definately the best show on Netflix, I LOVE SCI-FI!!';

  //TODO: Remove constant values and set up a user object to use in BLOC

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.background_color,
      body: SingleChildScrollView(
          child: Column(
        children: [
          //Pictures
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
            height: _size.height * 0.03,
          ),
          //Name, age
          Padding(
              padding: EdgeInsets.all(_size.width * 0.02),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nameAge,
                      style: TextStyle(
                          color: Colors.white, fontSize: _size.width * 0.07),
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
                    color: Constants.sky_blue, fontSize: _size.width * 0.05)),
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
                  vertical: _size.width * 0.02, horizontal: _size.width * 0.03),
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
                  vertical: _size.width * 0.02, horizontal: _size.width * 0.03),
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
                  vertical: _size.width * 0.02, horizontal: _size.width * 0.03),
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
          SizedBox(height: _size.height * 0.02),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: _size.width * 0.02, horizontal: _size.width * 0.03),
              child: Text(
                Constants.ALGORAND_WALLET_ADDRESS,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: _size.width * 0.055,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          //Wallet address
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: _size.width * 0.02, horizontal: _size.width * 0.03),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color.fromARGB(255, 17, 17, 36)),
              child: Padding(
                padding: EdgeInsets.all(_size.width * 0.03),
                child: Column(
                  children: [
                    Text(
                      walletAddress,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: _size.width * 0.05),
                    ),
                    SizedBox(height: _size.height * 0.04),
                    GestureDetector(
                      onTap: () {
                        //TODO:Copy wallet address
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: _size.width * 0.02,
                            horizontal: _size.width * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.copy,
                              color: Colors.blue[400],
                              size: _size.width * 0.06,
                            ),
                            SizedBox(
                              width: _size.width * 0.02,
                            ),
                            Text(
                              Constants.COPY_WALLET_ADDRESS,
                              style: TextStyle(
                                  color: Colors.blue[400],
                                  fontSize: _size.width * 0.05),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: _size.width * 0.02, horizontal: _size.width * 0.03),
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
                vertical: _size.width * 0.02, horizontal: _size.width * 0.04),
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
          //Lifestyle
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: _size.width * 0.02, horizontal: _size.width * 0.03),
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
                vertical: _size.width * 0.02, horizontal: _size.width * 0.04),
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
          //Share wallet address
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: _size.width * 0.02, horizontal: _size.width * 0.03),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color.fromARGB(255, 17, 17, 36),
              ),
              child: GestureDetector(
                onTap: () {
                  //TODO: SHARE WALLET ADDRESS
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
          )
        ],
      )),
    );
  }
}
