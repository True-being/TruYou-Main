import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/screens/app_root.dart';
import 'package:truyou/screens/create-account-screens/create_account_general.dart';

class SignInEmailScreen extends StatefulWidget {
  const SignInEmailScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SignInEmailScreen(),
      settings: const RouteSettings(name: Routes.signInEmailScreen),
    );
  }

  @override
  State<SignInEmailScreen> createState() => _SignInEmailScreenState();
}

class _SignInEmailScreenState extends State<SignInEmailScreen> {
  //Email and password controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Form key - Validation
  final GlobalKey<FormState> _emailPasswordFormKey = GlobalKey<FormState>();

  void _signInButtonPressed() {
    //Validates text fields
    if (_emailPasswordFormKey.currentState!.validate()) {
      //Sign user in
      //TODO:Navigate to home screen
      Navigator.of(context)
          .pushAndRemoveUntil(AppRoot.route(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.background_color,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Constants.background_color,
          leading: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(ResponsiveWidget.size(
                  context, _size.width * 0.02, _size.width * 0.005)),
              child: IconButton(
                key: Key(Keys.signInWithEmailbackToWelcomeScreen),
                icon: Icon(
                  CupertinoIcons.back,
                  size: ResponsiveWidget.size(
                      context, _size.width * 0.07, _size.width * 0.03),
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Logo(width: _size.width * 0.6, height: _size.height * 0.3),
            Visibility(
              visible: ResponsiveWidget.isSmallScreen(context),
              child: GradientText(
                Constants.SIGN_IN_MESSAGE,
                gradient: LinearGradient(colors: [
                  Constants.sky_blue,
                  Constants.pink,
                ]),
                style: TextStyle(
                    fontSize: ResponsiveWidget.size(
                        context, _size.width * 0.065, _size.width * 0.03),
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: ResponsiveWidget.size(
                  context, _size.height * 0.02, _size.height * 0.0),
            ),
            Form(
              key: _emailPasswordFormKey,
              child: Padding(
                padding: EdgeInsets.all(ResponsiveWidget.size(
                    context, _size.width * 0.04, _size.width * 0.01)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Email field
                    CustomTextField(
                        textFieldKey:
                            Key(Fields.emailPasswordSignInEmailKey.key),
                        title: Constants.EMAIL,
                        hintText: Constants.EMAIL,
                        maxLines: 1,
                        validator: emailValidator,
                        formatter: shortTextFormatter(),
                        controller: _emailController),
                    //Password field
                    CustomTextField(
                      textFieldKey:
                          Key(Fields.emailPasswordSignInPasswordKey.key),
                      title: Constants.PASSWORD,
                      hintText: Constants.PASSWORD,
                      maxLines: 1,
                      validator: passwordValidator,
                      formatter: passwordFormatter(),
                      controller: _passwordController,
                      obsecure: true,
                      char: '*',
                    ),
                    //Forgot  Password
                    Align(
                      alignment: ResponsiveWidget.isSmallScreen(context)
                          ? Alignment.centerRight
                          : ResponsiveWidget.isLargeScreen(context)
                              ? Alignment.center
                              : Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ResponsiveWidget.size(context,
                                _size.width * 0.02, _size.height * 0.005),
                            horizontal: _size.width * 0.02),
                        child: RichText(
                          text: TextSpan(
                              text: Constants.FORGOT_PASSWORD_CLICKABLE_TEXT,
                              style: TextStyle(
                                  color: Constants.purple,
                                  fontSize: ResponsiveWidget.size(context,
                                      _size.width * 0.04, _size.width * 0.02),
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //TODO: Navigate to forgot password screen
                                }),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: ResponsiveWidget.isLargeScreen(context),
                        child: SizedBox(
                          height: _size.height * 0.02,
                        )),
                    //Login button
                    GlowButton(
                        key: Key(Keys.signInWithEmailJumpInButton),
                        text: Constants.JUMP_IN_BUTTON_TEXT,
                        buttonWidth: ResponsiveWidget.size(
                            context, _size.width, _size.width * 0.35),
                        buttonHeight: ResponsiveWidget.size(
                            context, _size.height * 0.07, _size.height * 0.07),
                        verticalPadding: ResponsiveWidget.size(
                            context, _size.height * 0.04, _size.height * 0.01),
                        horizontalPadding: ResponsiveWidget.size(
                            context, _size.width * 0.01, _size.width * 0.005),
                        onPress: () {
                          _signInButtonPressed();
                        }),
                    //Don't have an account? Click me!
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(ResponsiveWidget.size(
                            context, _size.width * 0.02, _size.width * 0.005)),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: Constants.DONT_HAVE_ACCOUNT_TEXT,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ResponsiveWidget.size(
                                          context,
                                          _size.width * 0.04,
                                          _size.width * 0.02))),
                              TextSpan(
                                  text: Constants.CLICK_ME_TEXT,
                                  style: TextStyle(
                                      color: Constants.purple,
                                      fontSize: ResponsiveWidget.size(
                                          context,
                                          _size.width * 0.04,
                                          _size.width * 0.02),
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //Navigates to Create an Account screen
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateAccountGeneralScreen()));
                                    }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
