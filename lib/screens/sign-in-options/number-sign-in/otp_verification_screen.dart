import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:pinput/pinput.dart';
import 'package:truyou/screens/app_root.dart';
import 'package:truyou/screens/create-account-screens/create_account_general.dart';

class OTPVerficationScreen extends StatefulWidget {
  final String countryCode;
  final String phoneNumber;

  static MaterialPageRoute route(String countryCode, String phoneNumber) {
    return MaterialPageRoute(
        builder: (context) => OTPVerficationScreen(
            countryCode: countryCode, phoneNumber: phoneNumber),
        settings: const RouteSettings(name: Routes.otpVerificationScreen));
  }

  const OTPVerficationScreen(
      {Key? key, required this.countryCode, required this.phoneNumber})
      : super(key: key);

  @override
  State<OTPVerficationScreen> createState() => _OTPVerficationScreenState();
}

class _OTPVerficationScreenState extends State<OTPVerficationScreen> {
  //Entered OTP code
  String _sms = '';

  //Form key - Validation
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _verifyAndNavigateToHome() {
    //Validates form fields
    if (_formKey.currentState!.validate()) {
      //TODO:Verify OTP code
      Navigator.of(context).pushAndRemoveUntil(
          CreateAccountGeneralScreen.route(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.background_color,
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: ResponsiveWidget.size(
                        context, _size.height * 0.07, _size.height * 0.03),
                  ),
                  Image.asset(
                    'assets/otp_ver.png',
                    height: _size.height * 0.2,
                    width: _size.width * 0.5,
                  ),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  //Verification text
                  GradientText(
                    Constants.VERIFICATION,
                    gradient: LinearGradient(colors: [
                      Constants.sky_blue,
                      Constants.pink,
                    ]),
                    style: TextStyle(
                        fontSize: ResponsiveWidget.size(
                            context, _size.width * 0.1, _size.width * 0.04)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: _size.height * 0.02,
                  ),
                  // Your code will be sent to (+1) 904-3049-3331
                  Text(
                    '${Constants.CODE_WILL_BE_SENT_TO} (+${widget.countryCode}) ${formatPhoneNumber(widget.phoneNumber)}',
                    style: TextStyle(
                        color: Constants.sky_blue,
                        fontSize: ResponsiveWidget.size(
                            context, _size.width * 0.04, _size.width * 0.02)),
                  ),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  //Pin entry - 4 digits
                  Container(
                    child: Pinput(
                      key: Key(Fields.otpVerificationPinInput.key),
                      validator: otpValidator,
                      defaultPinTheme: PinTheme(
                          width: ResponsiveWidget.size(context,
                              _size.height * 0.07, _size.height * 0.08),
                          height: ResponsiveWidget.size(context,
                              _size.height * 0.07, _size.height * 0.08),
                          textStyle: TextStyle(
                              fontSize: ResponsiveWidget.size(context,
                                  _size.width * 0.05, _size.width * 0.03),
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          decoration: BoxDecoration(
                              color: Colors.grey[900],
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10))),
                      onChanged: (pin) {
                        if (pin.length == 4) {
                          setState(() {
                            _sms = pin;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  //Resend code? button
                  Text(
                    Constants.RESEND_CODE,
                    style: TextStyle(
                        color: Constants.purple,
                        fontSize: ResponsiveWidget.size(
                            context, _size.width * 0.04, _size.width * 0.02)),
                  ),
                ],
              ),
            ),
          ),
        ),
        persistentFooterButtons: [
          //Next and previous button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ResponsiveWidget.size(
                      context, _size.width * 0.03, _size.width * 0.02),
                  horizontal: ResponsiveWidget.size(
                      context, _size.width * 0.03, _size.width * 0.35)),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: OutlinedGlowButton(
                      key: Key(Keys.otpVerificationBackButton),
                      buttonHeight: _size.height * 0.07,
                      buttonWidth: ResponsiveWidget.size(
                          context, _size.width, _size.width * 0.1),
                      widget: Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                        size: ResponsiveWidget.size(
                            context, _size.width * 0.06, _size.width * 0.035),
                      ),
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                      gradient: LinearGradient(
                        colors: [Constants.sky_blue, Constants.sky_blue],
                      ),
                      horizontalPadding: 0.0,
                      verticalPadding: 0.0,
                      glowColor: Constants.sky_blue,
                    ),
                  ),
                  SizedBox(
                    width: _size.width * 0.02,
                  ),
                  Expanded(
                    flex: 3,
                    child: OutlinedGlowButton(
                      key: Key(Keys.otpVerificationNextButton),
                      buttonHeight: _size.height * 0.07,
                      buttonWidth: _size.width,
                      widget: Text(
                        Constants.NEXT,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ResponsiveWidget.size(context,
                                _size.width * 0.055, _size.width * 0.025),
                            fontWeight: FontWeight.w400),
                      ),
                      onPress: () {
                        _verifyAndNavigateToHome();
                      },
                      horizontalPadding: 0.0,
                      verticalPadding: 0.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
