import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/screens/app_root.dart';
import 'package:truyou/screens/sign-in-options/email_sign_in_screen.dart';
import 'package:truyou/screens/sign-in-options/number-sign-in/number_sign_in.dart';

import '../screens.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SignInEmailScreen(),
      settings: const RouteSettings(name: Routes.welcomeScreen),
    );
  }

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size _size = MediaQuery.of(context).size;
    double _buttonHeight = w(context, 60);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.background_color,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SpacerV.c(context, 2.0),
              Logo(width: w(context, 475), height: w(context, 225.0)),
              //Welcome to TruYou
              GradientText(Constants.WELCOME_MESSAGE,
                  gradient: LinearGradient(colors: [
                    Constants.sky_blue,
                    Constants.pink,
                  ]),
                  style: theme.textTheme.headline1),
              SpacerV.c(
                  context,
                  ResponsiveWidget.size(
                      context, h(context, 3.0), h(context, 1.0))),
              //Sign in buttons
              OutlinedGlowButton(
                key: Key(Keys.emailLogin),
                widget: Text(Constants.CONTINUE_WITH_EMAIL,
                    style: theme.textTheme.headline3),
                buttonHeight: _buttonHeight,
                buttonWidth: ResponsiveWidget.size(
                    context, _size.width * 0.9, _size.width * 0.4),
                onPress: () {
                  Navigator.of(context).push(SignInEmailScreen.route());
                },
              ),
              OutlinedGlowButton(
                key: Key(Keys.perraWalletLogin),
                widget: Text(
                  Constants.SIGN_IN_WITH_PERAWALLET,
                  style: theme.textTheme.headline3,
                ),
                buttonHeight: _buttonHeight,
                buttonWidth: ResponsiveWidget.size(
                    context, _size.width * 0.9, _size.width * 0.4),
                onPress: () {
                  //TODO: Log into wallet
                },
              ),
              OutlinedGlowButton(
                key: Key(Keys.myAlgorandWalletLogin),
                widget: Text(Constants.SIGN_IN_WITH_MYALGOWALLET,
                    style: theme.textTheme.headline3),
                buttonHeight: _buttonHeight,
                buttonWidth: ResponsiveWidget.size(
                    context, _size.width * 0.9, _size.width * 0.4),
                onPress: () {
                  //TODO:Log into wallet
                },
              ),
              OutlinedGlowButton(
                key: Key(Keys.myPhoneNumberLogin),
                buttonHeight: _buttonHeight,
                buttonWidth: ResponsiveWidget.size(
                    context, _size.width * 0.9, _size.width * 0.4),
                widget: Text(
                  Constants.SIGN_IN_WITH_PHONE_NUMBER,
                  style: theme.textTheme.headline3,
                ),
                onPress: () {
                  Navigator.of(context).push(SignInPhoneNumber.route());
                },
              ),
              SpacerV.c(
                  context,
                  ResponsiveWidget.size(
                      context, h(context, 2.0), _size.height * 0.01)),
              //Don't have an account? Click me!
              Padding(
                padding: EdgeInsets.all(p(context, 8.0)),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: Constants.DONT_HAVE_ACCOUNT_TEXT,
                          style: theme.textTheme.headline6),
                      TextSpan(
                          text: Constants.CLICK_ME_TEXT,
                          style: theme.textTheme.headline6?.copyWith(
                              color: Constants.purple,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //TODO:Change this back to Create account general
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CreateAccountGeneralScreen()));
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => MatchPledging()));
                              // Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(
                              //         builder: (context) => AppRoot()),
                              //     (route) => false);
                            }),
                    ],
                  ),
                ),
              ),
              //Privacy Terms & Terms and conditions
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: p(context, 12.0), horizontal: p(context, 17.0)),
                  child: RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: Constants.BY_CLICKING_ON_ME_TEXT,
                            style: theme.textTheme.headline6
                                ?.copyWith(color: Constants.sky_blue)),
                        TextSpan(
                            text: Constants.TERMS_OF_SERVICE_TEXT,
                            style: theme.textTheme.headline6?.copyWith(
                                color: Constants.sky_blue,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //TODO:Open Privacy policy
                              }),
                        TextSpan(
                            text: Constants.AND_OUR_TEXT,
                            style: theme.textTheme.headline6
                                ?.copyWith(color: Constants.sky_blue)),
                        TextSpan(
                            text: Constants.PRIVACY_POLICY_TEXT,
                            style: theme.textTheme.headline6?.copyWith(
                                color: Constants.sky_blue,
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
