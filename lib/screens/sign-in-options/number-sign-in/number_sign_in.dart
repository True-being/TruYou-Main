import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/screens/sign-in-options/number-sign-in/otp_verification_screen.dart';

class SignInPhoneNumber extends StatefulWidget {
  const SignInPhoneNumber({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SignInPhoneNumber(),
      settings: const RouteSettings(name: '/phone-number-sign-in'),
    );
  }

  @override
  State<SignInPhoneNumber> createState() => _SignInPhoneNumberState();
}

class _SignInPhoneNumberState extends State<SignInPhoneNumber> {
  //Phone number controller
  TextEditingController _phoneNumberController = TextEditingController();

  //Form key - Validation
  GlobalKey<FormState> _numberFormKey = GlobalKey<FormState>();

  //Country code - Changed through the country code picker
  String _countryCode = '1';

  void _getMyOtpCodePressed() {
    //Validates textfields
    if (_numberFormKey.currentState!.validate()) {
      //TODO:Execute send code logic first, then navigate
      Navigator.of(context).push(OTPVerficationScreen.route(
          _countryCode, _phoneNumberController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Constants.background_color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(ResponsiveWidget.size(
                    context, _size.width * 0.02, _size.width * 0.005)),
                child: IconButton(
                  key: Key('sign-in-with-phone-number-back-button'),
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
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: _size.width * 0.03, horizontal: _size.width * 0.05),
              child: GradientText(
                Constants.CONTINUE_WITH_PHONE_NUMBER,
                gradient: LinearGradient(
                    colors: [Constants.sky_blue, Constants.pink]),
                style: TextStyle(
                    fontSize: ResponsiveWidget.size(
                        context, _size.width * 0.1, _size.width * 0.04)),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              Constants.ENTER_COUNTRY_CODE_AND_NUMBER,
              style: TextStyle(
                  color: Constants.sky_blue,
                  fontSize: ResponsiveWidget.size(
                      context, _size.width * 0.04, _size.width * 0.02)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: ResponsiveWidget.size(
                      context, _size.width * 0.02, _size.width * 0.3)),
              child: Column(
                children: [
                  SizedBox(
                    height: _size.height * 0.06,
                  ),
                  Visibility(
                    visible: ResponsiveWidget.isSmallScreen(context),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: _size.width * 0.02),
                        child: Text(
                          Constants.PHONE_NUMBER,
                          style: TextStyle(
                              fontSize: ResponsiveWidget.size(context,
                                  _size.width * 0.045, _size.width * 0.025),
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: _numberFormKey,
                    child: Row(
                      children: [
                        //Country code
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: _size.width * 0.01,
                              horizontal: _size.width * 0.01),
                          child: GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                onSelect: (Country country) {
                                  setState(() {
                                    _countryCode = country.phoneCode;
                                  });
                                },
                              );
                            },
                            child: Container(
                              height: ResponsiveWidget.size(context,
                                  _size.width * 0.15, _size.width * 0.05),
                              width: ResponsiveWidget.size(context,
                                  _size.width * 0.15, _size.width * 0.05),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[900],
                              ),
                              child: Center(
                                child: Text(
                                  '+$_countryCode',
                                  style: TextStyle(
                                      fontSize: ResponsiveWidget.size(
                                          context,
                                          _size.width * 0.045,
                                          _size.width * 0.018),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Phone number
                        Flexible(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: _size.height * 0.01,
                                  horizontal: _size.width * 0.01),
                              child: TextFormField(
                                key: Key('phone-number-text-field'),
                                keyboardType: TextInputType.numberWithOptions(),
                                controller: _phoneNumberController,
                                validator: phoneNumberValidator,
                                inputFormatters: phoneNumberFormatter(),
                                maxLength: 10,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveWidget.size(
                                        context,
                                        _size.width * 0.045,
                                        _size.width * 0.018)),
                                cursorColor: Colors.grey[600],
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintText: Constants.PHONE_NUMBER,
                                  hintStyle: TextStyle(color: Colors.grey[600]),
                                  counterText: '',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  fillColor: Colors.grey[900],
                                  filled: true,
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: ResponsiveWidget.size(
                                          context,
                                          _size.width * 0.045,
                                          _size.width * 0.018)),
                                  focusColor: Colors.black,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        //Get my OTP Code button
        Align(
          alignment: Alignment.bottomCenter,
          child: GlowButton(
              key: Key('get-my-otp-code-button'),
              text: Constants.GET_MY_OTP_CODE,
              buttonWidth: ResponsiveWidget.size(
                  context, _size.width, _size.width * 0.4),
              buttonHeight: _size.height * 0.07,
              horizontalPadding: 0.0,
              onPress: () {
                _getMyOtpCodePressed();
              }),
        ),
      ],
    ));
  }
}
