import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truyou/bloc/auth_bloc/auth_bloc.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ForgotPasswordScreen(),
      settings: const RouteSettings(name: Routes.resetPassword),
    );
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  //Sign In bloc
  final _authBloc = getit<AuthBloc>();

  //Form key - Validation
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();

  void _resetPassword() {
    //Validates text fields
    if (_emailFormKey.currentState!.validate()) {
      _authBloc.add(AuthEvent.resetPassword(_emailController.text));
      Navigator.pop(context);
      CustomDialog.showBasicDialog(context, Constants.PASSWORD_RESET,
          Constants.CHECK_YOUR_EMAIL, Routes.resetPasswordDialog);
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
            print(exception);
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
                  Constants.RESET_PASSWORD,
                  style: theme.textTheme.headline2
                      ?.copyWith(color: Colors.white, fontSize: 35),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: p(context, 2.0), horizontal: p(context, 20.0)),
                child: Text(
                  'Please enter the email you would like to reset the password for',
                  style: theme.textTheme.headline2?.copyWith(
                      color: Colors.grey[500],
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SpacerV.m(context),
              Form(
                key: _emailFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: p(context, 0.0), horizontal: p(context, 8.0)),
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
                          showLabel: false,
                          maxLines: 1,
                          validator: emailValidator,
                          formatter: shortTextFormatter(),
                          controller: _emailController),
                    ],
                  ),
                ),
              )
            ],
          )),
          persistentFooterButtons: [
            GlowButton(
                key: Key(Keys.signInWithEmailJumpInButton),
                text: Constants.RESET_PASSWORD,
                buttonWidth: ResponsiveWidget.size(
                    context, _size.width, _size.width * 0.35),
                buttonHeight: ResponsiveWidget.size(
                    context, _size.height * 0.07, _size.height * 0.07),
                verticalPadding: p(context, 16.0),
                horizontalPadding: p(context, 16.0),
                onPress: () {
                  _resetPassword();
                })
          ],
        ),
      ),
    );
  }
}
