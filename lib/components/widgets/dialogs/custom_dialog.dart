import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foil/foil.dart';
import 'dart:io' show Platform;

import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/validators/trust_validator.dart';
import 'package:truyou/screens/chats/chat_viewer.dart';
import 'package:truyou/screens/gift-screens/choose_gift_screen.dart';
import 'package:truyou/screens/profile/user_profile.dart';

class CustomDialog {
  //Show platform specialized dialog
  static void showBasicDialog(
      BuildContext context, String title, String content, String route,
      [bool isDismissable = true]) {
    Size _size = MediaQuery.of(context).size;
    return Platform.isIOS
        ? _iosDialog(context, _size, title, content, route)
        : _androidDialog(context, _size, title, content, route);
  }

  ///Gift confirmation dialog
  ///Displays to confirm users sending of gift to another user
  static void showGiftConfirmationDialog(
      BuildContext context, String receipient, String giftName) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      routeSettings: RouteSettings(name: '/gift-confirmation-dialog'),
      context: context,
      useRootNavigator: false,
      builder: (context) {
        //TODO: Add stateful builder when dealing with actions
        return AlertDialog(
            backgroundColor: Constants.background_color,
            content: Container(
              width: size.width * 0.4,
              height: size.height * 0.23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: Text(
                      Constants.GIFT_CONFIRMATION_MESSAGE(receipient, giftName),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: size.width * 0.05),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //No
                      OutlinedGlowButton(
                          widget: Text(
                            Constants.NO,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                          buttonWidth: size.width * 0.23,
                          buttonHeight: size.height * 0.07,
                          onPress: () {
                            Navigator.of(context).pop();
                          }),
                      //Yes
                      OutlinedGlowButton(
                          widget: Text(
                            Constants.YES,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                          buttonWidth: size.width * 0.23,
                          buttonHeight: size.height * 0.07,
                          onPress: () {
                            //TODO:Send user gift
                          }),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }

  ///Match Invite Dialog
  ///Confirms user wants to send invite after matching with another user
  static void showMatchInviteDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      routeSettings: RouteSettings(name: '/match-invite-dialog'),
      context: context,
      useRootNavigator: false,
      builder: (context) {
        //TODO: Add stateful builder when dealing with actions
        return AlertDialog(
            backgroundColor: Constants.background_color,
            content: Container(
              width: size.width * 0.4,
              height: size.height * 0.23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: Text(
                      Constants.SEND_AN_INVITE_DIALOG_MESSAGE(50),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: size.width * 0.05),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //No
                      OutlinedGlowButton(
                          widget: Text(
                            Constants.NO,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                          buttonWidth: size.width * 0.23,
                          buttonHeight: size.height * 0.07,
                          onPress: () {
                            Navigator.of(context).pop();
                          }),
                      //Yes
                      OutlinedGlowButton(
                          widget: Text(
                            Constants.YES,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                          buttonWidth: size.width * 0.23,
                          buttonHeight: size.height * 0.07,
                          onPress: () {
                            //TODO:Match users and execute smart contracts
                          }),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }

  ///Match option Dialog
  ///Displays four options on your matches
  ///1) View Profile -> Navigates to persons profile
  ///2) Start Conversation -> Navigates you to a chat with the user
  ///3) Send a Gift -> Navigates to "Choose a gift page"
  ///4) Unmatch -> Unmatches with the currently matched user
  static void showMatchOptionDialog(BuildContext context, String receipient) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      routeSettings: RouteSettings(name: Routes.matchOptionDialog),
      context: context,
      // useRootNavigator: false,
      builder: (context) {
        //TODO: Add stateful builder when dealing with actions
        return AlertDialog(
            backgroundColor: Constants.background_color,
            content: Container(
              width: size.width * 0.5,
              height: size.height * 0.5,
              child: Column(
                children: [
                  //View profile
                  OutlinedGlowButton(
                      key: Key(Keys.matchOptionsViewProfileButton),
                      widget: Text(
                        Constants.VIEW_PROFILE,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.045),
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
                      key: Key(Keys.matchOptionStartConversationButton),
                      widget: Text(
                        Constants.START_CONVERSATION,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.045),
                      ),
                      buttonWidth: size.width * 0.6,
                      buttonHeight: size.height * 0.07,
                      onPress: () {
                        //TODO:Get users profile
                        //TODO:Navigate to chat
                        Navigator.of(context).pop();
                        Navigator.of(context).push(ChatViewer.route());
                      }),
                  //Send a gift
                  OutlinedGlowButton(
                      key: Key(Keys.matchOptionSendUserAGiftButton),
                      widget: Text(
                        Constants.SEND_USER_A_GIFT,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.045),
                      ),
                      buttonWidth: size.width * 0.6,
                      buttonHeight: size.height * 0.07,
                      onPress: () {
                        //TODO:Get users profile
                        //TODO:Navigate to send a gift
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChooseGiftScreen(
                                  receipient: receipient,
                                )));
                      }),
                  Stack(
                    children: [
                      //Request a VR Date
                      OutlinedGlowButton(
                          gradient:
                              LinearGradient(colors: [Colors.red, Colors.red]),
                          widget: Text(
                            Constants.REQUEST_A_VR_DATE,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.045),
                          ),
                          buttonWidth: size.width * 0.6,
                          buttonHeight: size.height * 0.07,
                          onPress: () {
                            //TODO:Coming soon
                          }),
                      //Coming soon
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(p(context, 8)),
                            child: Text(
                              Constants.COMING_SOON,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.02),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Unmatch
                  OutlinedGlowButton(
                      key: Key(Keys.matchOptionsUnmatchButton),
                      widget: Text(
                        Constants.UNMATCH,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.045),
                      ),
                      buttonWidth: size.width * 0.6,
                      buttonHeight: size.height * 0.07,
                      onPress: () {
                        //TODO:Get users profile
                        //TODO:Unmatch with user and pop
                        Navigator.of(context).pop();
                        CustomDialog.showUnmatchDialog(context, 'Michael');
                      }),
                ],
              ),
            ));
      },
    );
  }

  ///Displays Gift Recieved Error Dialog
  static void showErrorDialog(BuildContext context, String errorMessage) {
    Size size = MediaQuery.of(context).size;
    showDialog(
        routeSettings: RouteSettings(name: '/gift-received-error-dialog'),
        context: context,
        useRootNavigator: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Constants.background_color,
            title: Icon(
              Icons.error,
              color: Constants.indigo,
              size: size.width * 0.2,
            ),
            content: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: ResponsiveWidget.size(
                      context, size.width * 0.05, size.width * 0.2)),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  Constants.OK,
                  style: TextStyle(
                      color: Constants.sky_blue,
                      fontSize: ResponsiveWidget.size(
                          context, size.width * 0.04, size.width * 0.02)),
                ),
              )
            ],
          );
        });
  }

  ///Displays Gift Recieved Error Dialog
  static void showReceivedGiftDialog(
      BuildContext context, String sender, String gift) {
    Size size = MediaQuery.of(context).size;
    showDialog(
        routeSettings: RouteSettings(name: '/gift-received-dialog'),
        context: context,
        useRootNavigator: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Constants.background_color,
            title: Icon(
              Icons.verified,
              color: Constants.sky_blue,
              size: size.width * 0.2,
            ),
            content: Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Text(
                Constants.GIFT_RECEIVED_MESSAGE(sender, gift),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: ResponsiveWidget.size(
                        context, size.width * 0.06, size.width * 0.2)),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  Constants.OK,
                  style: TextStyle(
                      color: Constants.sky_blue,
                      fontSize: ResponsiveWidget.size(
                          context, size.width * 0.05, size.width * 0.02)),
                ),
              )
            ],
          );
        });
  }

  ///Unmatch dialog
  ///Confirms is the user wants to unmatch with another user
  static void showUnmatchDialog(BuildContext context, String user) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      routeSettings: RouteSettings(name: Routes.unmatchUserDialog),
      context: context,
      useRootNavigator: false,
      builder: (context) {
        //TODO: Add stateful builder when dealing with actions
        return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Constants.background_color,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.04, horizontal: size.width * 0.02),
                child: Text(
                  Constants.UNMATCH_MESSAGE(user),
                  key: Key(Keys.confirmUnmatchDialogMessage),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontSize: size.width * 0.05),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //NoconfirmUnmatchDialogMessage
                  Flexible(
                    child: OutlinedGlowButton(
                        widget: Text(
                          Constants.NO,
                          style: TextStyle(
                              color: Colors.white, fontSize: size.width * 0.05),
                        ),
                        buttonWidth: size.width * 0.23,
                        buttonHeight: size.height * 0.07,
                        onPress: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  //Yes
                  OutlinedGlowButton(
                      widget: Text(
                        Constants.YES,
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.05),
                      ),
                      buttonWidth: size.width * 0.23,
                      buttonHeight: size.height * 0.07,
                      onPress: () {
                        //TODO:UNMATCH users
                      }),
                ],
              )
            ]);
      },
    );
  }

  static void showConfirmTossDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      routeSettings: RouteSettings(name: Routes.confirmTossDialog),
      context: context,
      useRootNavigator: false,
      builder: (context) {
        //TODO: Add stateful builder when dealing with actions
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Constants.background_color,
            content: Container(
              width: size.width * 0.4,
              height: size.height * 0.23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.width * 0.04,
                        horizontal: size.width * 0.02),
                    child: Text(
                      Constants.TOSS_GIFT_CONFIRMATION,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: size.width * 0.05),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //No
                      OutlinedGlowButton(
                          widget: Text(
                            Constants.NO,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                          buttonWidth: size.width * 0.23,
                          buttonHeight: size.height * 0.07,
                          onPress: () {
                            Navigator.of(context).pop();
                          }),
                      //Yes
                      OutlinedGlowButton(
                          widget: Text(
                            Constants.YES,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                          buttonWidth: size.width * 0.23,
                          buttonHeight: size.height * 0.07,
                          onPress: () {
                            //TODO:Remove item from list and send message to sender
                          }),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }

  //TODO: Perhaps have a callback to purchase role screen? Instead of direct execution here?
  static void showConfirmPurchaseRole(BuildContext context, String roleTitle) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      routeSettings: RouteSettings(name: Routes.confirmPurchaseRoleDialog),
      context: context,
      useRootNavigator: false,
      builder: (context) {
        //TODO: Add stateful builder when dealing with actions
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Constants.background_color,
            content: Container(
              width: size.width * 0.4,
              height: size.height * 0.23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.width * 0.04,
                        horizontal: size.width * 0.02),
                    child: Text(
                      Constants.PURCHASE_ROLE_CONFIRMATION_MESSAGE(roleTitle),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: size.width * 0.05),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //No
                      OutlinedGlowButton(
                          widget: Text(
                            Constants.NO,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                          buttonWidth: size.width * 0.23,
                          buttonHeight: size.height * 0.07,
                          onPress: () {
                            Navigator.of(context).pop();
                          }),
                      //Yes
                      OutlinedGlowButton(
                          widget: Text(
                            Constants.YES,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                          buttonWidth: size.width * 0.23,
                          buttonHeight: size.height * 0.07,
                          onPress: () {
                            //TODO:Initiate smart contract
                          }),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }

  static void showPremiumFeatures(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var _stakeTrustController = TextEditingController(text: '01');
    showDialog(
      routeSettings: RouteSettings(name: Routes.confirmPurchaseRoleDialog),
      context: context,
      useRootNavigator: false,
      builder: (context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Constants.blue_jeans,
          children: [
            //Exit button
            Padding(
              padding: EdgeInsets.only(right: p(context, 8.0)),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: w(context, 25),
                    )),
              ),
            ),
            //Premium features title
            Padding(
              padding: EdgeInsets.only(top: p(context, 4.0)),
              child: Align(
                alignment: Alignment.center,
                child: Text(Constants.PREMIUM_FEATURES,
                    style: theme.textTheme.headline2?.copyWith(
                        color: Colors.white,
                        fontSize: f(context, 26),
                        fontWeight: FontWeight.w500)),
              ),
            ),
            //APR of trust token
            Padding(
              padding: EdgeInsets.only(top: p(context, 8.0)),
              child: Align(
                alignment: Alignment.center,
                child: Text(Constants.APR_OF_TRUST_TOKEN + '45%',
                    style: theme.textTheme.headline2?.copyWith(
                        color: Colors.white,
                        fontSize: f(context, 18),
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SpacerV.m(context),
            //Get Trust
            Padding(
              padding: EdgeInsets.only(left: p(context, 32.0)),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                    size: w(context, 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(Constants.GET_TRUST,
                      style: theme.textTheme.headline2?.copyWith(
                          color: Colors.white,
                          fontSize: f(context, 19),
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
            SpacerV.c(context, 2.0),
            //Pledge Trust
            Padding(
              padding: EdgeInsets.only(left: p(context, 32.0)),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                    size: w(context, 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(Constants.PLEDGE_TRUST,
                      style: theme.textTheme.headline2?.copyWith(
                          color: Colors.white,
                          fontSize: f(context, 19),
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
            SpacerV.c(context, 2.0),
            //Pledge Trust
            Padding(
              padding: EdgeInsets.only(left: p(context, 32.0)),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.white,
                    size: w(context, 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(Constants.GO_SOCIAL,
                      style: theme.textTheme.headline2?.copyWith(
                          color: Colors.white,
                          fontSize: f(context, 19),
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
            SpacerV.m(context),
            //Amount of trust token to pledge
            Padding(
              padding: EdgeInsets.only(top: p(context, 8.0)),
              child: Align(
                alignment: Alignment.center,
                child: Text(Constants.AMOUNT_OF_TRUST_TO_PLEDGE,
                    style: theme.textTheme.headline2?.copyWith(
                        color: Colors.white,
                        fontSize: f(context, 16),
                        fontWeight: FontWeight.w500)),
              ),
            ),
            //Textfield
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: p(context, 16.0), horizontal: p(context, 16.0)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _stakeTrustController,
                textAlign: TextAlign.center,
                inputFormatters: stakeTrustFormatter(),
                validator: trustValidator,
                onFieldSubmitted: (String value) {
                  _stakeTrustController.text = value;
                },
                style: TextStyle(
                    color: Constants.background_color,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
            //Amount of trust token to pledge
            Align(
              alignment: Alignment.center,
              child: Text(Constants.PLEDGE_RATIO,
                  style: theme.textTheme.headline2?.copyWith(
                      color: Colors.white,
                      fontSize: f(context, 16),
                      fontWeight: FontWeight.w500)),
            ),
            SpacerV.s(context),
            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedGlowButton(
                    widget: Text(
                      Constants.NO_THANKS,
                      style: theme.textTheme.headline2?.copyWith(
                          color: Colors.white,
                          fontSize: f(context, 17),
                          fontWeight: FontWeight.w500),
                    ),
                    buttonWidth: w(context, 125),
                    buttonHeight: w(context, 45),
                    onPress: () {
                      //TODO: Navigate to current screen
                      //Navigator.pop(context)
                      Navigator.pop(context);
                    }),
                OutlinedGlowButton(
                    widget: Text(
                      Constants.LET_ME_IN,
                      style: theme.textTheme.headline2?.copyWith(
                          color: Colors.white,
                          fontSize: f(context, 17),
                          fontWeight: FontWeight.w500),
                    ),
                    buttonWidth: w(context, 125),
                    buttonHeight: w(context, 45),
                    onPress: () {})
              ],
            )
          ],
        );
      },
    );
  }
}

///Displays the iOS specific custom dialog
void _iosDialog(BuildContext context, Size size, String title, String content,
    String route) {
  showCupertinoDialog(
    routeSettings: RouteSettings(name: route),
    useRootNavigator: false,
    context: context,
    builder: (context) {
      return Theme(
        data: ThemeData.dark(),
        child: CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
                color: Colors.grey[400],
                fontSize: ResponsiveWidget.size(
                    context, size.width * 0.05, size.width * 0.025)),
          ),
          content: Text(
            content,
            style: TextStyle(
                color: Colors.grey[400],
                fontSize: ResponsiveWidget.size(
                    context, size.width * 0.04, size.width * 0.02)),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                Constants.OK,
                style: TextStyle(
                    color: Constants.sky_blue,
                    fontSize: ResponsiveWidget.size(
                        context, size.width * 0.04, size.width * 0.02)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    },
  );
}

///Displays the android specific custom dialog
void _androidDialog(
  BuildContext context,
  Size size,
  String title,
  String content,
  String route,
) {
  showDialog(
    routeSettings: RouteSettings(name: route),
    context: context,
    useRootNavigator: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Constants.background_color,
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveWidget.size(
                  context, size.width * 0.05, size.width * 0.025)),
        ),
        content: Text(
          content,
          style: TextStyle(
              color: Colors.grey[400],
              fontSize: ResponsiveWidget.size(
                  context, size.width * 0.04, size.width * 0.02)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              Constants.OK,
              style: TextStyle(
                  color: Constants.sky_blue,
                  fontSize: ResponsiveWidget.size(
                      context, size.width * 0.04, size.width * 0.02)),
            ),
          )
        ],
      );
    },
  );
}
