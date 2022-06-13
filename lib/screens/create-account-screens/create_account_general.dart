import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/models/auth_user_model.dart';
import 'package:truyou/repository/cloud_function_repository.dart';
import 'package:truyou/repository/user_repository.dart';
import 'package:truyou/screens/create-account-screens/create_account_details.dart';

//TODO: Make route to create account details -> PushAndRemoveUntil

class CreateAccountGeneralScreen extends StatefulWidget {
  const CreateAccountGeneralScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CreateAccountGeneralScreen(),
      settings: const RouteSettings(name: Routes.createAccountGeneralScreen),
    );
  }

  @override
  State<CreateAccountGeneralScreen> createState() =>
      _CreateAccountGeneralScreenState();
}

class _CreateAccountGeneralScreenState
    extends State<CreateAccountGeneralScreen> {
  //Info Controllers
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  
  final _cloudFunctionRepository = getit<CloudFunctionRepository>();

  //Form key - Validation
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Birth Date
  DateTime? _birthDate;

  void _onPressedNextButton() async {
    //Validates textfields
    if (_formKey.currentState!.validate()) {
      // Checks if a date has been selected
      if (!(await _cloudFunctionRepository
          .doesEmailAlreadyExist(_emailController.text))) {
        if (_birthDate != null) {
          //Checks if the users age is over 18
          if (DateHelper.getAge(_birthDate!) >= 18) {
            //Checks if password and confirm password match
            if (_passwordController.text == _confirmPasswordController.text) {
              Navigator.of(context).push(CreateAccountDetailsScreen.route(
                AuthUser(
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    email: _emailController.text,
                    birthDate: _birthDate!,
                    isWalletVerified: null,
                    algoWalletAddress: null,
                    aboutMe: null,
                    lifeStyle: null,
                    job: null,
                    companyName: null,
                    location: null,
                    gender: null,
                    sexualOrientation: null),
                _passwordController.text,
              ));
            } else {
              CustomDialog.showBasicDialog(
                  context,
                  Constants.PASSWORDS_DONT_MATCH,
                  Constants.PLEASE_CONFIRM_YOUR_PASSWORD_AGAIN,
                  '/confirm-password');
            }
          } else {
            CustomDialog.showBasicDialog(context, Constants.PORTALS_ARENT_SAFE,
                Constants.YOU_NEED_TO_BE_OVER_18, '/over-eighteen');
          }
        } else {
          CustomDialog.showBasicDialog(context, Constants.DATE_NOT_ENTERED,
              Constants.PLEASE_ENTER_A_DATE, '/enter-date');
        }
      } else {
        CustomDialog.showBasicDialog(context, Constants.EMAIL_ALREADY_EXISTS,
            Constants.PLEASE_ENTER_ANOTHER_EMAIL, '/email-already-exists');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Constants.background_color,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                  key: Key(Keys.createAccountGeneralBackButton),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: ResponsiveWidget.size(
                        context, _size.width * 0.07, _size.width * 0.035),
                  )),
            ),
            body: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveWidget.size(
                              context, 0.0, _size.width * 0.25)),
                      child: Column(children: [
                        GradientText(
                          Constants.CREATE_AN_ACCOUNT,
                          gradient: LinearGradient(
                              colors: [Constants.sky_blue, Constants.pink]),
                          style: TextStyle(
                              fontSize: ResponsiveWidget.size(context,
                                  _size.width * 0.1, _size.width * 0.04)),
                        ),
                        SizedBox(
                          height: _size.height * 0.03,
                        ),
                        //First & Last name
                        Row(
                          children: [
                            //First name
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(ResponsiveWidget.size(
                                    context,
                                    _size.width * 0.03,
                                    _size.width * 0.01)),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: ResponsiveWidget.size(
                                                context,
                                                _size.width * 0.03,
                                                _size.width * 0.01),
                                            left: _size.width * 0.01),
                                        child: Text(
                                          Constants.FIRST_NAME,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ResponsiveWidget.size(
                                                  context,
                                                  _size.width * 0.04,
                                                  _size.width * 0.02),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      key: Key(Fields
                                          .createAccountGeneralFirstNameKey
                                          .key),
                                      cursorColor: Constants.sky_blue,
                                      controller: _firstNameController,
                                      validator: (String? val) => nameValidator(
                                          val, Constants.FIRST_NAME),
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: ResponsiveWidget.size(
                                              context,
                                              _size.width * 0.04,
                                              _size.width * 0.02)),
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide.none),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          fillColor: Colors.grey[900],
                                          filled: true,
                                          hintText: Constants.FIRST_NAME,
                                          hintStyle: TextStyle(
                                              color: Colors.white54,
                                              fontSize: ResponsiveWidget.size(
                                                  context,
                                                  _size.width * 0.04,
                                                  _size.width * 0.02))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Last name
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(ResponsiveWidget.size(
                                    context,
                                    _size.width * 0.03,
                                    _size.width * 0.01)),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: ResponsiveWidget.size(
                                                context,
                                                _size.width * 0.03,
                                                _size.width * 0.01),
                                            left: _size.width * 0.01),
                                        child: Text(
                                          Constants.LAST_NAME,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ResponsiveWidget.size(
                                                  context,
                                                  _size.width * 0.04,
                                                  _size.width * 0.02),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      key: Key(Fields
                                          .createAccountGeneralLastNameKey.key),
                                      cursorColor: Constants.sky_blue,
                                      controller: _lastNameController,
                                      validator: (String? val) => nameValidator(
                                          val, Constants.LAST_NAME),
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: ResponsiveWidget.size(
                                              context,
                                              _size.width * 0.04,
                                              _size.width * 0.02)),
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide.none),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          fillColor: Colors.grey[900],
                                          filled: true,
                                          hintText: Constants.LAST_NAME,
                                          hintStyle: TextStyle(
                                              color: Colors.white54,
                                              fontSize: ResponsiveWidget.size(
                                                  context,
                                                  _size.width * 0.04,
                                                  _size.width * 0.02))),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        //Email
                        CustomTextField(
                            textFieldKey:
                                Key(Fields.createAccountGeneralEmailKey.key),
                            title: Constants.EMAIL,
                            hintText: Constants.EMAIL,
                            maxLines: 1,
                            validator: emailValidator,
                            formatter: shortTextFormatter(),
                            controller: _emailController,
                            horizontalPadding: ResponsiveWidget.size(
                                context, _size.width * 0.01, 0.0)),
                        //Day - Month - Year -> 12 September 2001
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(ResponsiveWidget.size(
                                  context, _size.width * 0.01, 0.0)),
                              child: Column(
                                children: [
                                  //Birth date text
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          ResponsiveWidget.size(
                                              context,
                                              _size.width * 0.02,
                                              _size.width * 0.015),
                                          ResponsiveWidget.size(
                                              context,
                                              _size.width * 0.02,
                                              _size.width * 0.005),
                                          ResponsiveWidget.size(
                                              context, _size.width * 0.02, 0.0),
                                          ResponsiveWidget.size(context,
                                              _size.width * 0.02, 0.0)),
                                      child: Text(Constants.DATE_OF_BIRTH,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ResponsiveWidget.size(
                                                  context,
                                                  _size.width * 0.05,
                                                  _size.width * 0.02),
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                  //Birth Date
                                  Padding(
                                    padding: EdgeInsets.all(
                                        ResponsiveWidget.size(
                                            context,
                                            _size.width * 0.02,
                                            _size.width * 0.01)),
                                    child: TextFormField(
                                      key: Key(
                                          'create-account-general-birth-date'),
                                      onTap: () {
                                        DatePicker.showDatePicker(
                                          context,
                                          locale: LocaleType.en,
                                          showTitleActions: true,
                                          minTime: DateTime(1900, 01, 01),
                                          maxTime: DateTime.now(),
                                          onConfirm: (date) {
                                            setState(() {
                                              _birthDate = date;

                                              _birthDateController.text =
                                                  DateHelper.dateToStandardDate(
                                                      date);
                                            });
                                          },
                                          currentTime: _birthDate,
                                          theme: DatePickerTheme(
                                            doneStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: ResponsiveWidget.size(
                                                    context,
                                                    _size.width * 0.05,
                                                    _size.width * 0.02)),
                                            backgroundColor:
                                                Constants.background_color,
                                            containerHeight: _size.height * 0.3,
                                            itemStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: ResponsiveWidget.size(
                                                    context,
                                                    _size.width * 0.05,
                                                    _size.width * 0.02)),
                                            cancelStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: ResponsiveWidget.size(
                                                    context,
                                                    _size.width * 0.05,
                                                    _size.width * 0.02)),
                                          ),
                                        );
                                      },
                                      readOnly: true,
                                      cursorColor: Constants.sky_blue,
                                      controller: _birthDateController,
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: ResponsiveWidget.size(
                                              context,
                                              _size.width * 0.04,
                                              _size.width * 0.02)),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide.none),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          fillColor: Colors.grey[900],
                                          filled: true,
                                          hintText: Constants.TAP_TO_ENTER_DATE,
                                          hintStyle: TextStyle(
                                              color: Colors.white54,
                                              fontSize: ResponsiveWidget.size(
                                                  context,
                                                  _size.width * 0.04,
                                                  _size.width * 0.02))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Password
                            CustomTextField(
                                textFieldKey: Key(
                                    Fields.createAccountGeneralPassword.key),
                                title: Constants.PASSWORD,
                                hintText: Constants.PASSWORD,
                                maxLines: 1,
                                validator: passwordValidator,
                                formatter: passwordFormatter(),
                                controller: _passwordController,
                                obsecure: true,
                                char: '*',
                                horizontalPadding: ResponsiveWidget.size(
                                    context, _size.width * 0.01, 0.0)),
                            //Confirm password
                            CustomTextField(
                                textFieldKey: Key(Fields
                                    .createAccountGeneralConfirmPassword.key),
                                title: Constants.CONFIRM_PASSWORD,
                                hintText: Constants.CONFIRM_PASSWORD,
                                maxLines: 1,
                                validator: passwordValidator,
                                formatter: passwordFormatter(),
                                controller: _confirmPasswordController,
                                obsecure: true,
                                char: '*',
                                horizontalPadding: ResponsiveWidget.size(
                                    context, _size.width * 0.01, 0.0)),
                            //Next Button
                            OutlinedGlowButton(
                              key: Key(Keys.createAccountGeneralNextButton),
                              horizontalPadding: ResponsiveWidget.size(context,
                                  _size.width * 0.03, _size.width * 0.1),
                              widget: Text(
                                Constants.NEXT,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveWidget.size(
                                        context,
                                        _size.width * 0.055,
                                        _size.width * 0.025),
                                    fontWeight: FontWeight.w400),
                              ),
                              buttonHeight: _size.height * 0.07,
                              buttonWidth: _size.width,
                              onPress: () {
                                _onPressedNextButton();
                              },
                            ),
                          ],
                        ),
                      ]),
                    )))));
  }
}
