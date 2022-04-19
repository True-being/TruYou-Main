import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/screens/profile/user_profile.dart';

class MatchOptionDialog {
  static void showOptionDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      routeSettings: RouteSettings(name: '/match-option-dialog'),
      context: context,
      useRootNavigator: false,
      builder: (context) {
        //TODO: Add stateful builder when dealing with actions
        return AlertDialog(
            backgroundColor: Constants.background_color,
            content: Container(
              width: size.width * 0.4,
              height: size.height * 0.4,
              child: Column(
                children: [
                  //View profile
                  OutlinedGlowButton(
                      widget: Text(
                        Constants.VIEW_PROFILE,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.05),
                      ),
                      buttonWidth: size.width * 0.6,
                      buttonHeight: size.height * 0.07,
                      onPress: () {
                        //TODO:Get users profile
                        //TODO:Navigate to User Profile
                        //TODO: CHANGE STATIC USER PROFILE TO DYNAMIC USER PROFILE
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UserProfile()));
                      }),
                  //Start conversation
                  OutlinedGlowButton(
                      widget: Text(
                        Constants.START_CONVERSATION,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.05),
                      ),
                      buttonWidth: size.width * 0.6,
                      buttonHeight: size.height * 0.07,
                      onPress: () {
                        //TODO:Get users profile
                        //TODO:Navigate to chat
                      }),
                  //Send a gift
                  OutlinedGlowButton(
                      widget: Text(
                        Constants.SEND_USER_A_GIFT,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.05),
                      ),
                      buttonWidth: size.width * 0.6,
                      buttonHeight: size.height * 0.07,
                      onPress: () {
                        //TODO:Get users profile
                        //TODO:Navigate to send a gift
                      }),
                  //Unmatch
                  OutlinedGlowButton(
                      widget: Text(
                        Constants.UNMATCH,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.05),
                      ),
                      buttonWidth: size.width * 0.6,
                      buttonHeight: size.height * 0.07,
                      onPress: () {
                        //TODO:Get users profile
                        //TODO:Unmatch with user and pop
                      }),
                ],
              ),
            ));
      },
    );
  }
}
