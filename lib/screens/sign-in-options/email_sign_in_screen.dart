import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truyou/bloc/auth_bloc/auth_bloc.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/screens/app_root.dart';
import 'package:truyou/screens/sign-in-options/forgot_password.dart';

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

  //Sign In bloc
  final _authBloc = getit<AuthBloc>();

  //Form key - Validation
  final GlobalKey<FormState> _emailPasswordFormKey = GlobalKey<FormState>();

  void _signInButtonPressed() {
    //Validates text fields
    if (_emailPasswordFormKey.currentState!.validate()) {
      _authBloc.add(AuthEvent.signInButtonPressed(
          _emailController.text, _passwordController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return BlocListener<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        state.maybeWhen(
          failed: (exception) {
            //TODO: Display dialog
          },
          authenticatedAuthentication: () {
            Navigator.of(context)
                .pushAndRemoveUntil(AppRoot.route(), (route) => false);
          },
          orElse: () {},
        );
      },
      child: SafeArea(
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerV.m(context),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: p(context, 2.0), horizontal: p(context, 20.0)),
                child: Text(
                  'Welcome!',
                  style: theme.textTheme.headline2
                      ?.copyWith(color: Colors.white, fontSize: 35),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: p(context, 2.0), horizontal: p(context, 20.0)),
                child: Text(
                  'Please sign in to continue',
                  style: theme.textTheme.headline2?.copyWith(
                      color: Colors.grey[500],
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SpacerV.m(context),
              Form(
                key: _emailPasswordFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: p(context, 0.0), horizontal: p(context, 16.0)),
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
                          showLabel: true,
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
                        showLabel: true,
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
                                    Navigator.push(
                                        context, ForgotPasswordScreen.route());
                                  }),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: ResponsiveWidget.isLargeScreen(context),
                          child: SizedBox(
                            height: _size.height * 0.02,
                          )),
                    ],
                  ),
                ),
              )
            ],
          )),
          persistentFooterButtons: [
            Column(
              children: [
                GlowButton(
                    key: Key(Keys.signInWithEmailJumpInButton),
                    text: Constants.JUMP_IN_BUTTON_TEXT,
                    buttonWidth: ResponsiveWidget.size(
                        context, _size.width, _size.width * 0.35),
                    buttonHeight: ResponsiveWidget.size(
                        context, _size.height * 0.07, _size.height * 0.07),
                    verticalPadding: p(context, 16.0),
                    horizontalPadding: p(context, 16.0),
                    onPress: () {
                      _signInButtonPressed();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
