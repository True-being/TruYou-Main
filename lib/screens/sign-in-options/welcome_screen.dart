import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/repository/wallet_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import '../screens.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const WelcomeScreen(),
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
        body: Column(
          children: [
            Logo(width: w(context, 600), height: w(context, 300.0)),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                child: GradientText(
                  'Your portal for love in the metaverse',
                  textAlign: TextAlign.center,
                  gradient: LinearGradient(colors: [
                    Constants.sky_blue,
                    Constants.pink,
                  ]),
                  style: theme.textTheme.headline1?.copyWith(
                    fontSize: 33,
                  ),
                )),
          ],
        ),
        persistentFooterButtons: [_buildButtons(context)],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    final theme = Theme.of(context);
    Size _size = MediaQuery.of(context).size;
    double _buttonHeight = w(context, 60);
    return Column(
      children: [
        GlowButton(
          key: Key(Keys.emailLogin),
          text: Constants.SIGN_IN,
          buttonHeight: _buttonHeight,
          borderRadius: 5.0,
          buttonWidth: ResponsiveWidget.size(
              context, _size.width * 0.9, _size.width * 0.4),
          onPress: () {
            Navigator.of(context).push(SignInEmailScreen.route());
          },
        ),
        Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  height: 2,
                  color: Colors.white,
                  indent: 80,
                  endIndent: 80,
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(1.0),
                color: Constants.background_color,
                child: Text('OR',
                    style: theme.textTheme.headline3?.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 17,
                        color: Colors.grey[400])),
              ),
            )
          ],
        ),
        OutlinedGlowButton(
          //TODO: Change key
          //TODO: Updates tests
          key: Key(Keys.perraWalletLogin),
          widget: Text(
            Constants.SIGN_UP,
            style: theme.textTheme.headline3
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          buttonHeight: _buttonHeight,
          buttonWidth: ResponsiveWidget.size(
              context, _size.width * 0.9, _size.width * 0.4),
          onPress: () {
            // WalletRepository.connectToWallet(context);
            //Navigate to create account general
            Navigator.push(context, CreateAccountGeneralScreen.route());
          },
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: p(context, 3.0), horizontal: p(context, 17.0)),
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
        ),
        SpacerV.c(context, 5.0),
      ],
    );
  }
}
