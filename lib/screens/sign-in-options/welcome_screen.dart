import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/custom_drawer.dart';
import 'package:truyou/screens/app_root.dart';
import 'package:truyou/screens/create-account-screens/create_account_general.dart';
import 'package:truyou/screens/home/home_screen.dart';
import 'package:truyou/screens/match-pledging/match_pledging_screen.dart';
import 'package:truyou/screens/sign-in-options/email_sign_in_screen.dart';
import 'package:truyou/screens/sign-in-options/number-sign-in/number_sign_in.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SignInEmailScreen(),
      settings: const RouteSettings(name: '/welcome-screen'),
    );
  }

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _buttonHeight = _size.height * 0.07;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.background_color,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _size.height * 0.01,
              ),
              Logo(width: _size.width * 0.6, height: _size.height * 0.3),
              //Welcome to TruYou
              GradientText(
                Constants.WELCOME_MESSAGE,
                gradient: LinearGradient(colors: [
                  Constants.sky_blue,
                  Constants.pink,
                ]),
                style: TextStyle(
                    fontSize: ResponsiveWidget.size(
                        context, _size.width * 0.065, _size.width * 0.025),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: ResponsiveWidget.size(
                    context, _size.height * 0.05, _size.height * 0.02),
              ),
              //Sign in buttons
              OutlinedGlowButton(
                key: Key('email-login'),
                widget: Text(
                  Constants.CONTINUE_WITH_EMAIL,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveWidget.size(
                          context, _size.width * 0.055, _size.width * 0.025),
                      fontWeight: FontWeight.w400),
                ),
                buttonHeight: _buttonHeight,
                buttonWidth: ResponsiveWidget.size(
                    context, _size.width, _size.width * 0.4),
                onPress: () {
                  Navigator.of(context).push(SignInEmailScreen.route());
                },
              ),
              OutlinedGlowButton(
                key: Key('pera-wallet-login'),
                widget: Text(
                  Constants.SIGN_IN_WITH_PERAWALLET,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveWidget.size(
                          context, _size.width * 0.055, _size.width * 0.025),
                      fontWeight: FontWeight.w400),
                ),
                buttonHeight: _buttonHeight,
                buttonWidth: ResponsiveWidget.size(
                    context, _size.width, _size.width * 0.4),
                onPress: () {
                  //TODO: Log into wallet
                },
              ),
              OutlinedGlowButton(
                key: Key('my-algo-wallet-login'),
                widget: Text(
                  Constants.SIGN_IN_WITH_MYALGOWALLET,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveWidget.size(
                          context, _size.width * 0.055, _size.width * 0.025),
                      fontWeight: FontWeight.w400),
                ),
                buttonHeight: _buttonHeight,
                buttonWidth: ResponsiveWidget.size(
                    context, _size.width, _size.width * 0.4),
                onPress: () {
                  //TODO:Log into wallet
                },
              ),
              OutlinedGlowButton(
                key: Key('phone-number-login'),
                buttonHeight: _buttonHeight,
                buttonWidth: ResponsiveWidget.size(
                    context, _size.width, _size.width * 0.4),
                widget: Text(
                  Constants.SIGN_IN_WITH_PHONE_NUMBER,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveWidget.size(
                          context, _size.width * 0.055, _size.width * 0.025),
                      fontWeight: FontWeight.w400),
                ),
                onPress: () {
                  Navigator.of(context).push(SignInPhoneNumber.route());
                },
              ),
              SizedBox(
                height: ResponsiveWidget.size(
                    context, _size.height * 0.03, _size.height * 0.01),
              ),
              //Don't have an account? Click me!
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: Constants.DONT_HAVE_ACCOUNT_TEXT,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveWidget.size(context,
                                  _size.width * 0.04, _size.width * 0.02))),
                      TextSpan(
                          text: Constants.CLICK_ME_TEXT,
                          style: TextStyle(
                              color: Constants.purple,
                              fontSize: ResponsiveWidget.size(context,
                                  _size.width * 0.04, _size.width * 0.02),
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //TODO:Change this back to Create account general
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CreateAccountGeneralScreen()));
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => MatchPledging()));
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => AppRoot()));
                            }),
                    ],
                  ),
                ),
              ),
              //Privacy Terms & Terms and conditions
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: _size.height * 0.015,
                      horizontal: _size.width * 0.045),
                  child: RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: Constants.BY_CLICKING_ON_ME_TEXT,
                            style: TextStyle(
                                color: Constants.sky_blue,
                                fontSize: ResponsiveWidget.size(context,
                                    _size.width * 0.04, _size.width * 0.02))),
                        TextSpan(
                            text: Constants.TERMS_OF_SERVICE_TEXT,
                            style: TextStyle(
                                color: Constants.sky_blue,
                                fontSize: ResponsiveWidget.size(context,
                                    _size.width * 0.04, _size.width * 0.02),
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //TODO:Open Privacy policy
                              }),
                        TextSpan(
                            text: Constants.AND_OUR_TEXT,
                            style: TextStyle(
                                color: Constants.sky_blue,
                                fontSize: ResponsiveWidget.size(context,
                                    _size.width * 0.04, _size.width * 0.02))),
                        TextSpan(
                            text: Constants.PRIVACY_POLICY_TEXT,
                            style: TextStyle(
                                color: Constants.sky_blue,
                                fontSize: ResponsiveWidget.size(context,
                                    _size.width * 0.04, _size.width * 0.02),
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //TODO:Open terms and conditions
                              }),
                      ],
                    ),
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
