import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:truyou/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/components/widgets/loader.dart';
import 'package:truyou/components/widgets/user_profile_card.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  final _userProfileBloc = getit<UserProfileBloc>();

  @override
  void initState() {
    _userProfileBloc.add(UserProfileEvent.loadMyProfile());
    super.initState();
  }

  @override
  void dispose() {
    _userProfileBloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.background_color,
      body: SingleChildScrollView(
          child: BlocBuilder<UserProfileBloc, UserProfileState>(
            bloc: _userProfileBloc,
            builder: (context, state){
              return state.maybeWhen(
                  loading: () => Center(child: Loader()),
                  success: (user, location){
                    return Column(
                      children: [
                        //Pictures
                        Container(
                          width: _size.width,
                          height: _size.height * 0.5,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return UserProfileCard(imageURL: user.images![index]);
                            },
                            itemCount: user.images!.length,
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
                                  Flexible(
                                    child: Text(
                                      '${user.firstName} ${user.lastName}, ${DateHelper.getAge(user.birthDate)}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: _size.width * 0.07),
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.02),
                                  Visibility(
                                    visible: user.isWalletVerified!,
                                    child: Icon(
                                      Icons.verified,
                                      color: Constants.neon_yellow,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.all(_size.width * 0.02),
                          child: Text(user.job!,
                              style: TextStyle(
                                  color: Constants.sky_blue, fontSize: _size.width * 0.05)),
                        ),
                        //Verfied button
                        Visibility(
                          visible: user.isWalletVerified!,
                          child: Padding(
                            padding: EdgeInsets.all(_size.width * 0.02),
                            child: OutlinedGlowButton(
                                widget: Text(Constants.VERIFIED,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: _size.width * 0.05)),
                                buttonWidth: _size.width * 0.35,
                                buttonHeight: _size.height * 0.06,
                                onPress: () {}),
                          ),
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
                                  Flexible(
                                    child: Text(
                                      'Lives in $location',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: _size.width * 0.045,
                                          fontWeight: FontWeight.w300),
                                    ),
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
                                  Flexible(
                                    child: Text(
                                      'Works at ${user.job}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: _size.width * 0.045,
                                          fontWeight: FontWeight.w300),
                                    ),
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
                                  Flexible(
                                    child: Text(
                                      '${user.gender}, ${user.sexualOrientation}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: _size.width * 0.045,
                                          fontWeight: FontWeight.w300),
                                    ),
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
                                    '${user.algoWalletAddress}',
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
                                          Flexible(
                                            child: Text(
                                              Constants.COPY_WALLET_ADDRESS,
                                              style: TextStyle(
                                                  color: Colors.blue[400],
                                                  fontSize: _size.width * 0.05),
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
                              '${user.aboutMe}',
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
                              '${user.lifeStyle}',
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
                        //TODO: Add functionality in future
                        //Share wallet address
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       vertical: _size.width * 0.02, horizontal: _size.width * 0.03),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(15.0),
                        //       color: Color.fromARGB(255, 17, 17, 36),
                        //     ),
                        //     child: GestureDetector(
                        //       onTap: () {
                        //         SHARE WALLET ADDRESS
                        //       },
                        //       child: Padding(
                        //         padding: EdgeInsets.symmetric(
                        //             vertical: _size.width * 0.04,
                        //             horizontal: _size.width * 0.04),
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Icon(
                        //               Icons.share,
                        //               color: Constants.purple,
                        //               size: _size.width * 0.06,
                        //             ),
                        //             SizedBox(
                        //               width: _size.width * 0.02,
                        //             ),
                        //             Flexible(
                        //               child: Text(
                        //                 Constants.SHARE_PROFILE_NOW,
                        //                 style: TextStyle(
                        //                     color: Constants.purple,
                        //                     fontSize: _size.width * 0.05),
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    );
                  },
                  orElse: (){
                return Container();
              });
            },
          )),
    );
  }
}
