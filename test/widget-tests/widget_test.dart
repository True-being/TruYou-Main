import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/models/auth_user_model.dart';
import 'package:truyou/screens/screens.dart';
import 'dart:io' as io;

//TODO:Implement into all tests to reduce verbose tests
//Testing helper functions
//
//Tap button helper function
//Taps the button to trigger navigation or validation
Future<void> _tapButton(WidgetTester tester, String key) async {
  var _button = find.byKey(ValueKey(key));
  await tester.ensureVisible(_button);
  await tester.pumpAndSettle();
  return await tester.tap(_button);
}

//Validate textfield message helper function
//Retrieves the validated message from a textfield
Future<String?> _getValidatedMessage(
    WidgetTester tester, Finder textfield, String validatorText) async {
  final _validatedMessage = find.text(validatorText);
  final _validatedText = find
      .descendant(of: textfield, matching: _validatedMessage)
      .first
      .evaluate()
      .single
      .widget as Text;
  return _validatedText.data;
}

//Enters text helper function
//Enters text into the supplied textfield
Future<void> _enterText(
    WidgetTester tester, Finder textfield, String text) async {
  await tester.enterText(textfield, text);
  await tester.pumpAndSettle();
  return;
}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  io.HttpOverrides.global = null;
  await FlutterConfig.loadValueForTesting(
      {'GOOGLE_MAPS_API_KEY': 'AIzaSyAy_a2aHhcuyzetaI9PMnUhpg6zJP4VjXM'});

  MockNavigator navigator = MockNavigator();

  group('Widget testing', () {
    //Emails
    String mockEmail = 'JohnDoe@gmail.com';
    String mockInvalidEmail = '@@.com';
    //Passwords
    String mockPassword = 'J0hnD03M3rt!c';
    String mockShortPassword = 'Test';
    //Numbers
    String mockNumber = '9045863434';
    String mockShortNumber = '904';
    //Country code
    String mockCountryCode = '+1';
    //Extras
    String mockName = 'Joe';
    String mockShortName = 'E';
    String mockLongName = 'ShapiraNovaExtraPlanetSolarSystem';
    String mockInvalidName = r'&*#@$&&';
    String mockLastName = 'Soap';
    String mockShortLastName = 'D';
    String mockLongLastName = 'TerraFormingJumbleRumbleCrumble';
    String mockInvalidLastName = r'*%($*';
    String mockLongShortText =
        'I am a super duper epic software engineer who codeds crazy codes';
    DateTime mockDateTimeBirthDate = DateTime(1998, 02, 12);
    String mockInvalidWalletAddress = 'NCEHJXWE';
    String mockTooShortLongText = 'Blah blah blah';
    String mockWalletAddress =
        'XJHFEHJWEHFWHEH41HJ1HFUJH144789T1H4919FH4FH8147F1H9418FHF2UFH232';
    String mockAboutMe =
        'Hello, I am a passionate rock lover who studied geology at a very young age';
    String mockLifeStyle =
        'My lifestyle is adventurous. I love to explore the rocky mountains of the world';
    String mockCompany = 'Edcon Co.';
    String mockJob = 'Sr. Manager';
    //Mock user
    AuthUser user = new AuthUser(
        firstName: mockName,
        lastName: mockLastName,
        email: mockEmail,
        birthDate: mockDateTimeBirthDate,
        password: mockPassword,
        photos: null,
        algoWalletAddress: null,
        aboutMe: null,
        lifeStyle: null,
        job: null,
        companyName: null,
        location: null,
        gender: null,
        sexualOrientation: null);

    //! Welcome screen
    group('Welcome Screen', () {
      group('Welcome Screen Routing', () {
        when(() => navigator.push(any())).thenAnswer((_) async {});

        testWidgets('Navigate to email log in', (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: const WelcomeScreen(),
            ),
          ));

          //Finds the email sign in button and taps it
          var _signInWithEmailButton = find.byKey(ValueKey('email-login'));
          await tester.tap(_signInWithEmailButton);
          //Verifies the push
          verify(() => navigator.push(any(
                  that: isRoute<void>(whereName: equals('/email-sign-in')))))
              .called(1);
        });
        testWidgets('Navigate to phone number login',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: const WelcomeScreen(),
            ),
          ));

          //Finds the phone sign in button and taps it
          var _signInWithPhoneNumber =
              find.byKey(ValueKey('phone-number-login'));
          await tester.tap(_signInWithPhoneNumber);
          //Verifies the push
          verify(() => navigator.push(any(
              that: isRoute<void>(
                  whereName: equals('/phone-number-sign-in'))))).called(1);
        });

        //Issues accessing RichText..TextSpan..GestureRecognizer
        testWidgets('Navigate to create account screen',
            (WidgetTester tester) async {});
      });
    });

    //!Sign in with email
    group('Sign In With Email', () {
      //!Routing - Sign in with email
      group('Email Sign In Routing', () {
        testWidgets('Navigate to home screen', (WidgetTester tester) async {
          when(() => navigator.pushAndRemoveUntil(any(), any()))
              .thenAnswer((_) async {});

          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: const SignInEmailScreen(),
            ),
          ));

          //Enters a valid email into the email textfield
          await tester.enterText(
              find.byWidgetPredicate((widget) =>
                  widget is CustomTextField && widget.title == Constants.EMAIL),
              mockEmail);

          //Enters a valid password into the password textfield
          await tester.enterText(
              find.byWidgetPredicate((widget) =>
                  widget is CustomTextField &&
                  widget.title == Constants.PASSWORD),
              mockPassword);

          //Triggers frame after - Keyboard minimized
          await tester.pump();
          //Finds the Jump in button and taps it
          var button = find.byKey(ValueKey('jump-in-button'));
          await tester.ensureVisible(button);
          //Keeps triggering the frame after until the button is visible - Scrolling
          await tester.pumpAndSettle();
          await tester.tap(button);
          //Verifies the push and remove until to the home screen
          verify(() => navigator.pushAndRemoveUntil(
              any(that: isRoute<void>(whereName: equals('/home-screen'))),
              any())).called(1);
        });

        testWidgets('Pop to Welcome screen', (WidgetTester tester) async {
          when(() => navigator.pop(any())).thenAnswer((_) async {});

          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: const SignInEmailScreen(),
            ),
          ));
          //Find back button and taps on it
          final _backButton = find.byKey(ValueKey('back-to-welcome-screen'));
          await tester.ensureVisible(_backButton);
          await tester.pumpAndSettle();
          await tester.tap(_backButton);
          //Verifies the pop
          verify(() => navigator.pop(any())).called(1);
        });
      });

      //!Validation - Sign in with email
      group('Textfield validation', () {
        testWidgets('Empty email and password validation',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: const SignInEmailScreen(),
            ),
          );

          //Finds the Jump in button and taps it
          var button = find.byKey(ValueKey('jump-in-button'));
          await tester.ensureVisible(button);
          await tester.pumpAndSettle();
          await tester.tap(button);
          await tester.pump();

          //Finds Email & Password text fields
          final emailField = find.byKey(ValueKey('email-sign-in-email-field'));
          final passwordField =
              find.byKey(ValueKey('email-sign-in-password-field'));
          //Finds Email & Password validated messages
          final emailValidatedMessage =
              find.text(Constants.PLEASE_ENTER_AN_EMAIL);
          final passwordValidatedMessage =
              find.text(Constants.PLEASE_ENTER_A_PASSWORD);

          //Finds validated messages within the text field
          final emailValidationText = find
              .descendant(of: emailField, matching: emailValidatedMessage)
              .first
              .evaluate()
              .single
              .widget as Text;
          final passwordValidationText = find
              .descendant(of: passwordField, matching: passwordValidatedMessage)
              .first
              .evaluate()
              .single
              .widget as Text;

          //Verify correct validation messaged is displayed
          expect(emailValidationText.data, Constants.PLEASE_ENTER_AN_EMAIL,
              reason: 'Email validation text: ${emailValidationText.data}');
          expect(passwordValidationText.data, Constants.PLEASE_ENTER_A_PASSWORD,
              reason:
                  'Password validation text: ${passwordValidationText.data}');
        });

        testWidgets('Invalid email validation', (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: const SignInEmailScreen(),
            ),
          );

          //Finds Email text field
          final emailField = find.byKey(ValueKey('email-sign-in-email-field'));

          await tester.enterText(emailField, mockInvalidEmail);
          await tester.pumpAndSettle();

          //Presses jump in button
          var button = find.byKey(ValueKey('jump-in-button'));
          await tester.ensureVisible(button);
          await tester.pumpAndSettle();
          await tester.tap(button);
          await tester.pump();

          //Finds Email validated message
          final emailValidatedMessage =
              find.text(Constants.PLEASE_ENTER_A_VALID_EMAIL);

          //Finds validated message within the text field
          final emailValidationText = find
              .descendant(of: emailField, matching: emailValidatedMessage)
              .first
              .evaluate()
              .single
              .widget as Text;

          //Verify correct validation messaged is displayed
          expect(emailValidationText.data, Constants.PLEASE_ENTER_A_VALID_EMAIL,
              reason: 'Email validation text: ${emailValidationText.data}');
        });

        testWidgets('Invalid password length validation',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: const SignInEmailScreen(),
            ),
          );

          //Finds Email text field and enters short password
          final emailField =
              find.byKey(ValueKey('email-sign-in-password-field'));
          await tester.enterText(emailField, mockShortPassword);
          await tester.pumpAndSettle();

          //Finds Jump in button and taps it
          var button = find.byKey(ValueKey('jump-in-button'));
          await tester.ensureVisible(button);
          await tester.pumpAndSettle();
          await tester.tap(button);
          await tester.pump();

          //Finds password validated message
          final passwordValidatedMessage =
              find.text(Constants.PLEASE_ENTER_A_LONGER_PASSWORD);

          //Finds validated message within the text field
          final passwordValidationText = find
              .descendant(of: emailField, matching: passwordValidatedMessage)
              .first
              .evaluate()
              .single
              .widget as Text;

          //Verify correct validation messaged is displayed
          expect(passwordValidationText.data,
              Constants.PLEASE_ENTER_A_LONGER_PASSWORD,
              reason:
                  'Password validation text: ${passwordValidationText.data}');
        });
      });
    });
    //!Sign In with Phone Number
    group('Sign In with Phone Number', () {
      //!Routing - Sign In with Phone Number
      group('Sign in with phone number routing', () {
        testWidgets('Navigate to OTP verification screen',
            (WidgetTester tester) async {
          when(() => navigator.push(any())).thenAnswer((_) async {});
          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: const SignInPhoneNumber(),
            ),
          ));

          //Finds text field and enters mock number
          await tester.enterText(
              find.byKey(ValueKey('phone-number-text-field')), mockNumber);
          await tester.pump();

          //Find Get my OTP Code button and taps it
          var _getMyOTPCodeButton =
              find.byKey(ValueKey('get-my-otp-code-button'));
          await tester.ensureVisible(_getMyOTPCodeButton);
          await tester.pumpAndSettle();
          await tester.tap(_getMyOTPCodeButton);

          //Verifies push to OTP verification
          verify(() => navigator.push(any(
                  that: isRoute<void>(whereName: equals('/otp-verification')))))
              .called(1);
        });

        testWidgets('Pop to Welcome screen', (WidgetTester tester) async {
          when(() => navigator.pop()).thenAnswer((_) async {});

          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: const SignInPhoneNumber(),
            ),
          ));

          //Finds back button and taps it
          var _backButton =
              find.byKey(ValueKey('sign-in-with-phone-number-back-button'));
          await tester.ensureVisible(_backButton);
          await tester.pumpAndSettle();
          await tester.tap(_backButton);

          //Verifies pop occurs
          verify(() => navigator.pop(any())).called(1);
        });
      });
      //!Validation - Sign In with Phone Number

      group('Sign in with Phone number textfield validation', () {
        testWidgets('Empty phone number textifeld validation',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: const SignInPhoneNumber(),
            ),
          );

          //Finds Get my OTP Code button and taps it
          var _getMyOTPCodeButton =
              find.byKey(ValueKey('get-my-otp-code-button'));
          await tester.ensureVisible(_getMyOTPCodeButton);
          await tester.pumpAndSettle();
          await tester.tap(_getMyOTPCodeButton);
          await tester.pump();

          //Finds Phone number text field
          final _phoneNumberTextField =
              find.byKey(ValueKey('phone-number-text-field'));
          //Finds Phone number validated message
          final _phoneNumberValidatedMessage =
              find.text(Constants.PLEASE_ENTER_A_PHONE_NUMBER);

          //Finds validated messages within the text field
          final _phoneNumberValidationText = find
              .descendant(
                  of: _phoneNumberTextField,
                  matching: _phoneNumberValidatedMessage)
              .first
              .evaluate()
              .single
              .widget as Text;

          //Verify correct validation messaged is displayed
          expect(_phoneNumberValidationText.data,
              Constants.PLEASE_ENTER_A_PHONE_NUMBER,
              reason:
                  'Email validation text: ${_phoneNumberValidationText.data}');
        });

        testWidgets('Phone number too short validation textfield validation',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: const SignInPhoneNumber(),
            ),
          );

          //Finds Phone number text field
          var _phoneNumberTextField =
              find.byKey(ValueKey('phone-number-text-field'));

          //Enters short number into text field
          await tester.enterText(_phoneNumberTextField, mockShortNumber);

          await tester.pumpAndSettle();

          //Presses get my OTP button
          var _getMyOTPCodeButton =
              find.byKey(ValueKey('get-my-otp-code-button'));
          await tester.ensureVisible(_getMyOTPCodeButton);
          await tester.pumpAndSettle();
          await tester.tap(_getMyOTPCodeButton);
          await tester.pump();

          //Finds Phone number validated message
          final _phoneNumberValidatedMessage =
              find.text(Constants.PLEASE_ENTER_PHONE_NUMBER_WITH_TEN_DIGITS);

          //Finds validated messages within the text field
          final _phoneNumberValidationText = find
              .descendant(
                  of: _phoneNumberTextField,
                  matching: _phoneNumberValidatedMessage)
              .first
              .evaluate()
              .single
              .widget as Text;

          //Verify correct validation messaged is displayed
          expect(_phoneNumberValidationText.data,
              Constants.PLEASE_ENTER_PHONE_NUMBER_WITH_TEN_DIGITS,
              reason:
                  'Email validation text: ${_phoneNumberValidationText.data}');
        });
      });
    });

    //!OTP Verification screen
    group('OTP Verification', () {
      //!Routing - OTP Verification
      group('OTP Verification routing', () {
        testWidgets('Navigate to Home Screen', (WidgetTester tester) async {
          when(() => navigator.pushAndRemoveUntil(any(), any()))
              .thenAnswer((_) async {});

          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: OTPVerficationScreen(
                  countryCode: mockCountryCode, phoneNumber: mockNumber),
            ),
          ));

          var _otpVerificationPinInput =
              find.byKey(ValueKey('otp-verification-pin-input'));
          await tester.enterText(_otpVerificationPinInput, '0000');
          await tester.pumpAndSettle();

          //Finds Next button and taps on it
          var _otpVerificationNextButton =
              find.byKey(ValueKey('otp-verification-next-button'));
          await tester.ensureVisible(_otpVerificationNextButton);
          await tester.pumpAndSettle();
          await tester.tap(_otpVerificationNextButton);

          //Verifies push and remove until to home screen
          verify(() => navigator.pushAndRemoveUntil(
              any(that: isRoute<void>(whereName: equals('/home-screen'))),
              any())).called(1);
        });

        testWidgets('Pop to phone number screen', (WidgetTester tester) async {
          when(() => navigator.pop(any())).thenAnswer((_) async {});

          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: OTPVerficationScreen(
                  countryCode: mockCountryCode, phoneNumber: mockNumber),
            ),
          ));

          //Finds Back button and taps on it
          var _otpVerificationBackButton =
              find.byKey(ValueKey('otp-verification-back-button'));
          await tester.ensureVisible(_otpVerificationBackButton);
          await tester.pumpAndSettle();
          await tester.tap(_otpVerificationBackButton);

          //Verifies push and remove until to home screen
          verify(() => navigator.pop()).called(1);
        });
      });
      //!Validation - OTP Verification
      group('OTP Verification Pin input validation', () {
        testWidgets('Empty OTP pin validation', (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: OTPVerficationScreen(
                countryCode: mockCountryCode, phoneNumber: mockNumber),
          ));

          //Find OTP Pin Input
          var _otpVerificationPinInput =
              find.byKey(ValueKey('otp-verification-pin-input'));

          //Finds Next button and taps on it
          var _otpVerificationNextButton =
              find.byKey(ValueKey('otp-verification-next-button'));
          await tester.ensureVisible(_otpVerificationNextButton);
          await tester.pumpAndSettle();
          await tester.tap(_otpVerificationNextButton);
          await tester.pump();

          //Finds Phone number validated message
          final _otpValidatedMessage =
              find.text(Constants.PLEASE_ENTER_AN_OTP_VERIFICATION_CODE);

          //Finds validated messages within the text field
          final _otpValidationText = find
              .descendant(
                  of: _otpVerificationPinInput, matching: _otpValidatedMessage)
              .first
              .evaluate()
              .single
              .widget as Text;

          //Verify correct validation messaged is displayed
          expect(_otpValidationText.data,
              Constants.PLEASE_ENTER_AN_OTP_VERIFICATION_CODE,
              reason: 'Email validation text: ${_otpValidationText.data}');
        });

        testWidgets('Short OTP pin validation', (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: OTPVerficationScreen(
                countryCode: mockCountryCode, phoneNumber: mockNumber),
          ));

          //Find OTP Pin Input and enter short code(3 digits)
          var _otpVerificationPinInput =
              find.byKey(ValueKey('otp-verification-pin-input'));
          await tester.enterText(_otpVerificationPinInput, '000');
          //Validates when done button is pressed
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();

          //Finds Phone number validated message
          final _otpValidatedMessage =
              find.text(Constants.PLEASE_ENTER_A_FOUR_DIGIT_OTP_CODE);

          //Finds validated messages within the text field
          final _otpValidationText = find
              .descendant(
                  of: _otpVerificationPinInput, matching: _otpValidatedMessage)
              .first
              .evaluate()
              .single
              .widget as Text;

          //Verify correct validation messaged is displayed
          expect(_otpValidationText.data,
              Constants.PLEASE_ENTER_A_FOUR_DIGIT_OTP_CODE,
              reason: 'Email validation text: ${_otpValidationText.data}');
        });
      });
    });
    //!Create account general
    group('Create Account General', () {
      //!Routing - Create account general
      //TODO:NOT COMPLETED TEST
      group('Create account general routing', () {
        testWidgets('Navigate to Home Screen', (WidgetTester tester) async {
          when(() => navigator.push(any())).thenAnswer((_) async {});

          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: CreateAccountGeneralScreen(),
            ),
          ));

          var _nameTextField =
              find.byKey(ValueKey('create-account-general-first-name'));
          await tester.enterText(_nameTextField, mockName);
          await tester.pumpAndSettle();

          var _lastNameTextField =
              find.byKey(ValueKey('create-account-general-last-name'));
          await tester.enterText(_lastNameTextField, mockLastName);
          await tester.pumpAndSettle();

          var _emailTextField =
              find.byKey(ValueKey('create-account-general-email'));
          await tester.enterText(_emailTextField, mockEmail);
          await tester.pumpAndSettle();

          var _birthDateTextField =
              find.byKey(ValueKey('create-account-general-birth-date'));
          //TODO: Context issue? Navigation Issue?
          await tester.ensureVisible(_birthDateTextField);
          await tester.pumpAndSettle();
          await tester.tap(_birthDateTextField).catchError((_e) {
            print(_e);
          });

          await tester.pumpAndSettle();

          verify(() => navigator.push(any())).called(1);

          var _passwordTextField =
              find.byKey(ValueKey('create-account-general-password'));
          await tester.enterText(_passwordTextField, mockPassword);
          await tester.pumpAndSettle();

          var _confirmPasswordTextField =
              find.byKey(ValueKey('create-account-general-confirm-password'));
          await tester.enterText(_confirmPasswordTextField, mockPassword);
          await tester.pumpAndSettle();

          // Finds Next button and taps on it
          var _createAccountGeneralNextButton =
              find.byKey(ValueKey('create-account-general-next-button'));
          await tester.ensureVisible(_createAccountGeneralNextButton);
          await tester.pumpAndSettle();
          await tester.tap(_createAccountGeneralNextButton);

          // Verifies push and remove until to home screen
          verify(() => navigator.push(any(
                  that: isRoute<void>(
                      whereName: equals('/create-account-details-screen')))))
              .called(1);
        });

        testWidgets('Pop to any screen', (WidgetTester tester) async {
          when(() => navigator.pop(any())).thenAnswer((_) async {});

          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: CreateAccountGeneralScreen(),
            ),
          ));

          var _backButton =
              find.byKey(ValueKey('create-account-general-back-button'));
          await tester.ensureVisible(_backButton);
          await tester.pumpAndSettle();
          await tester.tap(_backButton);

          verify(() => navigator.pop(any())).called(1);
        });
      });
      //!Validation - Create account general
      group('Create account general valdation', () {
        group('Name validation', () {
          testWidgets('No name entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds first name textfield
            var _nameTextField =
                find.byKey(ValueKey('create-account-general-first-name'));

            //Finds next button and taps on it
            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _nameValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_NAME('first name'));

            //Finds validated messages within the text field
            final _nameValidationText = find
                .descendant(of: _nameTextField, matching: _nameValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_nameValidationText.data,
                Constants.PLEASE_ENTER_A_NAME('first name'),
                reason: 'Name validation text: ${_nameValidationText.data}');
          });

          testWidgets('Name too short validation', (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds first name textfield
            var _nameTextField =
                find.byKey(ValueKey('create-account-general-first-name'));

            await tester.enterText(_nameTextField, mockShortName);
            await tester.pumpAndSettle();

            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _nameValidatedMessage = find.text(
                Constants.PLEASE_ENTER_NAME_WITH_ATLEAST_TWO_CHARACTERS(
                    'first name'));

            //Finds validated messages within the text field
            final _nameValidationText = find
                .descendant(of: _nameTextField, matching: _nameValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(
                _nameValidationText.data,
                Constants.PLEASE_ENTER_NAME_WITH_ATLEAST_TWO_CHARACTERS(
                    'first name'),
                reason: 'Name validation text: ${_nameValidationText.data}');
          });

          testWidgets('Name too long validation', (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds first name textfield
            var _nameTextField =
                find.byKey(ValueKey('create-account-general-first-name'));

            await tester.enterText(_nameTextField, mockLongName);
            await tester.pumpAndSettle();

            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _nameValidatedMessage = find.text(
                Constants.PLEASE_ENTER_NAME_NO_LONGER_THAN_THIRTY_CHARACTERS(
                    'first name'));

            //Finds validated messages within the text field
            final _nameValidationText = find
                .descendant(of: _nameTextField, matching: _nameValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(
                _nameValidationText.data,
                Constants.PLEASE_ENTER_NAME_NO_LONGER_THAN_THIRTY_CHARACTERS(
                    'first name'),
                reason: 'Name validation text: ${_nameValidationText.data}');
          });

          testWidgets('Invalid name validation', (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds first name textfield
            var _nameTextField =
                find.byKey(ValueKey('create-account-general-first-name'));

            await tester.enterText(_nameTextField, mockInvalidName);
            await tester.pumpAndSettle();

            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _nameValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_VALID_NAME('first name'));

            //Finds validated messages within the text field
            final _nameValidationText = find
                .descendant(of: _nameTextField, matching: _nameValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_nameValidationText.data,
                Constants.PLEASE_ENTER_A_VALID_NAME('first name'),
                reason: 'Name validation text: ${_nameValidationText.data}');
          });
        });
        group('Last Name validation', () {
          testWidgets('No last name entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds last name textfield
            var _lastNameTextField =
                find.byKey(ValueKey('create-account-general-last-name'));

            //Finds next button and taps on it
            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds last name validated message
            final _nameValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_NAME('last name'));

            //Finds validated messages within the text field
            final _nameValidationText = find
                .descendant(
                    of: _lastNameTextField, matching: _nameValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_nameValidationText.data,
                Constants.PLEASE_ENTER_A_NAME('last name'),
                reason: 'Name validation text: ${_nameValidationText.data}');
          });

          testWidgets('Last Name too short validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds first name textfield
            var _lastNameTextField =
                find.byKey(ValueKey('create-account-general-last-name'));

            await tester.enterText(_lastNameTextField, mockShortLastName);
            await tester.pumpAndSettle();

            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _lastNameValidatedMessage = find.text(
                Constants.PLEASE_ENTER_NAME_WITH_ATLEAST_TWO_CHARACTERS(
                    'last name'));

            //Finds validated messages within the text field
            final _lastNameValidationText = find
                .descendant(
                    of: _lastNameTextField, matching: _lastNameValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(
                _lastNameValidationText.data,
                Constants.PLEASE_ENTER_NAME_WITH_ATLEAST_TWO_CHARACTERS(
                    'last name'),
                reason:
                    'Last name validation text: ${_lastNameValidationText.data}');
          });

          testWidgets('Last Name too long validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds first name textfield
            var _lastNameTextField =
                find.byKey(ValueKey('create-account-general-last-name'));

            await tester.enterText(_lastNameTextField, mockLongLastName);
            await tester.pumpAndSettle();

            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _lastNameValidatedMessage = find.text(
                Constants.PLEASE_ENTER_NAME_NO_LONGER_THAN_THIRTY_CHARACTERS(
                    'last name'));

            //Finds validated messages within the text field
            final _lastNameValidationText = find
                .descendant(
                    of: _lastNameTextField, matching: _lastNameValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(
                _lastNameValidationText.data,
                Constants.PLEASE_ENTER_NAME_NO_LONGER_THAN_THIRTY_CHARACTERS(
                    'last name'),
                reason:
                    'Last name validation text: ${_lastNameValidationText.data}');
          });

          testWidgets('Invalid name validation', (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds first name textfield
            var _lastNameTextField =
                find.byKey(ValueKey('create-account-general-last-name'));

            await tester.enterText(_lastNameTextField, mockInvalidLastName);
            await tester.pumpAndSettle();

            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _lastNameValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_VALID_NAME('last name'));

            //Finds validated messages within the text field
            final _lastNameValidationText = find
                .descendant(
                    of: _lastNameTextField, matching: _lastNameValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_lastNameValidationText.data,
                Constants.PLEASE_ENTER_A_VALID_NAME('last name'),
                reason:
                    'Last Name validation text: ${_lastNameValidationText.data}');
          });
        });
        group('Email validation', () {
          testWidgets('No email entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds email textfield
            var _emailTextField =
                find.byKey(ValueKey('create-account-general-email'));

            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _emailValidatedMessage =
                find.text(Constants.PLEASE_ENTER_AN_EMAIL);

            //Finds validated messages within the text field
            final _emailValidationText = find
                .descendant(
                    of: _emailTextField, matching: _emailValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_emailValidationText.data, Constants.PLEASE_ENTER_AN_EMAIL,
                reason: 'Email validation text: ${_emailValidationText.data}');
          });

          testWidgets('Invalid email entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds email textfield
            var _emailTextField =
                find.byKey(ValueKey('create-account-general-email'));

            await tester.enterText(_emailTextField, mockInvalidEmail);
            await tester.pumpAndSettle();

            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _emailValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_VALID_EMAIL);

            //Finds validated messages within the text field
            final _emailValidationText = find
                .descendant(
                    of: _emailTextField, matching: _emailValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(
                _emailValidationText.data, Constants.PLEASE_ENTER_A_VALID_EMAIL,
                reason: 'Email validation text: ${_emailValidationText.data}');
          });
        });
        group('Password validation', () {
          testWidgets('No password entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds password textfield
            var _passwordTextField =
                find.byKey(ValueKey('create-account-general-password'));

            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _passwordValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_PASSWORD);

            //Finds validated messages within the text field
            final _passwordValidationText = find
                .descendant(
                    of: _passwordTextField, matching: _passwordValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(
                _passwordValidationText.data, Constants.PLEASE_ENTER_A_PASSWORD,
                reason:
                    'Password validation text: ${_passwordValidationText.data}');
          });
          testWidgets('Password too short validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(MaterialApp(
              home: CreateAccountGeneralScreen(),
            ));
            //Finds password textfield
            var _passwordTextField =
                find.byKey(ValueKey('create-account-general-password'));

            await tester.enterText(_passwordTextField, mockShortPassword);
            await tester.pumpAndSettle();

            var _nextButton =
                find.byKey(ValueKey('create-account-general-next-button'));

            await tester.ensureVisible(_nextButton);
            await tester.pumpAndSettle();
            await tester.tap(_nextButton);
            await tester.pump();

            //Finds name validated message
            final _passwordValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_LONGER_PASSWORD);

            //Finds validated messages within the text field
            final _passwordValidationText = find
                .descendant(
                    of: _passwordTextField, matching: _passwordValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_passwordValidationText.data,
                Constants.PLEASE_ENTER_A_LONGER_PASSWORD,
                reason:
                    'Password validation text: ${_passwordValidationText.data}');
          });
        });
      });

      group('Error dialogs displayed', () {
        testWidgets('Must be over 18 error dialog displayed',
            (WidgetTester tester) async {});
        testWidgets(
            'Password match dialog displayed', (WidgetTester tester) async {});
      });
    });
    //!Create account details
    group('Create Account Details', () {
      Future<void> _tapFindMatchesButton(WidgetTester tester) async {
        //Finds find matches button and taps on it
        var _findMatchesButton =
            find.byKey(ValueKey('create-account-details-find-matches'));

        await tester.ensureVisible(_findMatchesButton);
        await tester.pumpAndSettle();
        await tester.tap(_findMatchesButton);
        await tester.pump();
      }

      Future<void> _enterAllFields(WidgetTester tester) async {
        var _walletTextField =
            find.byKey(ValueKey('create-account-details-wallet-address'));
        var _aboutMeTextField =
            find.byKey(ValueKey('create-account-details-about-me-field'));
        var _lifestyleTextField =
            find.byKey(ValueKey('create-account-details-life-style-field'));
        var _companyTextField =
            find.byKey(ValueKey('create-account-details-company-name-field'));
        var _jobTextField =
            find.byKey(ValueKey('create-account-details-job-title-field'));

        await tester.enterText(_walletTextField, mockWalletAddress);
        await tester.pumpAndSettle();
        await tester.enterText(_aboutMeTextField, mockAboutMe);
        await tester.pumpAndSettle();
        await tester.enterText(_lifestyleTextField, mockLifeStyle);
        await tester.pumpAndSettle();
        await tester.enterText(_companyTextField, mockCompany);
        await tester.pumpAndSettle();
        await tester.enterText(_jobTextField, mockJob);
        await tester.pumpAndSettle();
      }

      group('Create account details error dialogs', () {
        testWidgets('Location not enabled error dialog',
            (WidgetTester tester) async {
          when(() => navigator.push(any())).thenAnswer((_) async {});

          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: CreateAccountDetailsScreen(user: user),
            ),
          ));

          await _enterAllFields(tester);

          await _tapFindMatchesButton(tester);

          await tester.pumpAndSettle();

          verify(() => navigator.push(any(
              that: isRoute<void>(
                  whereName: equals('/location-not-enabled'))))).called(1);
        });

        //TODO:NOT COMPLETED TEST
        testWidgets('Verify wallet error dialog', (WidgetTester tester) async {
          when(() => navigator.push(any())).thenAnswer((_) async {});
          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: CreateAccountDetailsScreen(user: user),
            ),
          ));

          await _enterAllFields(tester);

          var _allowLocationPermissionButton = find.byKey(ValueKey(
              'create-account-details-allow-location-permission-button'));

          await tester.ensureVisible(_allowLocationPermissionButton);
          await tester.pumpAndSettle();
          await tester.tap(_allowLocationPermissionButton);

          await tester.pumpAndSettle();

          await _tapFindMatchesButton(tester);

          await tester.pumpAndSettle();

          verify(() => navigator.push(any(
              that: isRoute<void>(
                  whereName: equals('/wallet-not-verified'))))).called(1);
        });
        //TODO:NOT COMPLETED TEST
        testWidgets('Add atleast 2 images error dialogs',
            (WidgetTester tester) async {});
      });
      //!Routing - Create account details
      group('Create account details routing', () {
        //TODO: NOT COMPLETED TEST
        testWidgets('Navigate to Home screen', (WidgetTester tester) async {});
        testWidgets('Pop to Create account general',
            (WidgetTester tester) async {
          when(() => navigator.pop(any())).thenAnswer((_) async {});

          await tester.pumpWidget(MaterialApp(
            home: MockNavigatorProvider(
              navigator: navigator,
              child: CreateAccountDetailsScreen(user: user),
            ),
          ));

          //Finds Back button and taps on it
          var _createAccountDetailsBackButton =
              find.byKey(ValueKey('create-account-details-back-button'));
          await tester.ensureVisible(_createAccountDetailsBackButton);
          await tester.pumpAndSettle();
          await tester.tap(_createAccountDetailsBackButton);

          //Verifies push and remove until to home screen
          verify(() => navigator.pop()).called(1);
        });
      });
      //!Validation - Create account details
      group('Create account details validation', () {
        group('Wallet validation', () {
          testWidgets('No wallet address entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(home: CreateAccountDetailsScreen(user: user)));

            var _walletTextField =
                find.byKey(ValueKey('create-account-details-wallet-address'));

            await _tapFindMatchesButton(tester);

            //Finds wallet address validated message
            final _walletAddressValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_WALLET_ADDRESS);

            //Finds validated messages within the text field
            final _walletAddressValidationText = find
                .descendant(
                    of: _walletTextField,
                    matching: _walletAddressValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_walletAddressValidationText.data,
                Constants.PLEASE_ENTER_A_WALLET_ADDRESS,
                reason:
                    'Wallet address validation text: ${_walletAddressValidationText.data}');
          });

          testWidgets('Invalid length address entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(home: CreateAccountDetailsScreen(user: user)));

            var _walletTextField =
                find.byKey(ValueKey('create-account-details-wallet-address'));

            await tester.enterText(_walletTextField, mockInvalidWalletAddress);

            await tester.pumpAndSettle();

            await _tapFindMatchesButton(tester);

            //Finds wallet address validated message
            final _walletAddressValidatedMessage = find
                .text(Constants.PLEASE_ENTER_ADDRESS_EQUAL_TO_SIXTY_FOUR_CHARS);

            //Finds validated messages within the text field
            final _walletAddressValidationText = find
                .descendant(
                    of: _walletTextField,
                    matching: _walletAddressValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_walletAddressValidationText.data,
                Constants.PLEASE_ENTER_ADDRESS_EQUAL_TO_SIXTY_FOUR_CHARS,
                reason:
                    'Wallet address validation text: ${_walletAddressValidationText.data}');
          });
        });
        group('About Me validation', () {
          testWidgets('No about me entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(home: CreateAccountDetailsScreen(user: user)));

            var _aboutMeTextField =
                find.byKey(ValueKey('create-account-details-about-me-field'));

            await _tapFindMatchesButton(tester);

            //Finds wallet address validated message
            final _aboutMeValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_LONG_TEXT('about yourself'));

            //Finds validated messages within the text field
            final _aboutMeValidationText = find
                .descendant(
                    of: _aboutMeTextField, matching: _aboutMeValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_aboutMeValidationText.data,
                Constants.PLEASE_ENTER_A_LONG_TEXT('about yourself'),
                reason:
                    'About me validation text: ${_aboutMeValidationText.data}');
          });

          testWidgets('Too short about me entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(home: CreateAccountDetailsScreen(user: user)));

            var _aboutMeTextField =
                find.byKey(ValueKey('create-account-details-about-me-field'));

            await tester.enterText(_aboutMeTextField, mockTooShortLongText);
            await tester.pumpAndSettle();

            await _tapFindMatchesButton(tester);

            //Finds wallet address validated message
            final _aboutMeValidatedMessage = find.text(
                Constants.PLEASE_ENTER_A_LONG_TEXT_LONGER_THAN_THIRTY_CHARS);

            //Finds validated messages within the text field
            final _aboutMeValidationText = find
                .descendant(
                    of: _aboutMeTextField, matching: _aboutMeValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_aboutMeValidationText.data,
                Constants.PLEASE_ENTER_A_LONG_TEXT_LONGER_THAN_THIRTY_CHARS,
                reason:
                    'About me validation text: ${_aboutMeValidationText.data}');
          });
        });
        group('Life Style validation', () {
          testWidgets('No life style entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(home: CreateAccountDetailsScreen(user: user)));

            var _lifestyleTextField =
                find.byKey(ValueKey('create-account-details-life-style-field'));

            await _tapFindMatchesButton(tester);

            //Finds wallet address validated message
            final _lifestyleValidatedMessage = find.text(
                Constants.PLEASE_ENTER_A_LONG_TEXT('about your lifestyle'));

            //Finds validated messages within the text field
            final _lifestyleValidationText = find
                .descendant(
                    of: _lifestyleTextField,
                    matching: _lifestyleValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_lifestyleValidationText.data,
                Constants.PLEASE_ENTER_A_LONG_TEXT('about your lifestyle'),
                reason:
                    'Life style validation text: ${_lifestyleValidationText.data}');
          });
          testWidgets('Too  life style entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(home: CreateAccountDetailsScreen(user: user)));

            var _lifestyleTextField =
                find.byKey(ValueKey('create-account-details-life-style-field'));

            await tester.enterText(_lifestyleTextField, mockTooShortLongText);
            await tester.pumpAndSettle();

            await _tapFindMatchesButton(tester);

            //Finds wallet address validated message
            final _lifestyleValidatedMessage = find.text(
                Constants.PLEASE_ENTER_A_LONG_TEXT_LONGER_THAN_THIRTY_CHARS);

            //Finds validated messages within the text field
            final _lifestyleValidationText = find
                .descendant(
                    of: _lifestyleTextField,
                    matching: _lifestyleValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_lifestyleValidationText.data,
                Constants.PLEASE_ENTER_A_LONG_TEXT_LONGER_THAN_THIRTY_CHARS,
                reason:
                    'Life style validation text: ${_lifestyleValidationText.data}');
          });
        });
        group('Job validation', () {
          testWidgets('No Job entered validation', (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(home: CreateAccountDetailsScreen(user: user)));

            var _jobTitleTextField =
                find.byKey(ValueKey('create-account-details-job-title-field'));

            await _tapFindMatchesButton(tester);

            //Finds wallet address validated message
            final _jobTitleValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_SHORT_TEXT('job title'));

            //Finds validated messages within the text field
            final _jobTitleValidationText = find
                .descendant(
                    of: _jobTitleTextField, matching: _jobTitleValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_jobTitleValidationText.data,
                Constants.PLEASE_ENTER_A_SHORT_TEXT('job title'),
                reason:
                    'Job title validation text: ${_jobTitleValidationText.data}');
          });

          testWidgets('Too long Job entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(home: CreateAccountDetailsScreen(user: user)));

            var _jobTitleTextField =
                find.byKey(ValueKey('create-account-details-job-title-field'));

            await tester.enterText(_jobTitleTextField, mockLongShortText);
            await tester.pumpAndSettle();

            await _tapFindMatchesButton(tester);

            //Finds wallet address validated message
            final _jobTitleValidatedMessage = find.text(
                Constants.PLEASE_ENTER_SHORT_TEXT_WITH_LESS_THAN_FORTY_CHARS(
                    'job title'));

            //Finds validated messages within the text field
            final _jobTitleValidationText = find
                .descendant(
                    of: _jobTitleTextField, matching: _jobTitleValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(
                _jobTitleValidationText.data,
                Constants.PLEASE_ENTER_SHORT_TEXT_WITH_LESS_THAN_FORTY_CHARS(
                    'job title'),
                reason:
                    'Job title validation text: ${_jobTitleValidationText.data}');
          });
        });
        group('Company validation', () {
          testWidgets('No Job entered validation', (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(home: CreateAccountDetailsScreen(user: user)));

            var _companyTextField = find
                .byKey(ValueKey('create-account-details-company-name-field'));

            await _tapFindMatchesButton(tester);

            //Finds wallet address validated message
            final _companyNameValidatedMessage =
                find.text(Constants.PLEASE_ENTER_A_SHORT_TEXT('company name'));

            //Finds validated messages within the text field
            final _companyNameValidationText = find
                .descendant(
                    of: _companyTextField,
                    matching: _companyNameValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(_companyNameValidationText.data,
                Constants.PLEASE_ENTER_A_SHORT_TEXT('company name'),
                reason:
                    'Company name validation text: ${_companyNameValidationText.data}');
          });

          testWidgets('Too long Company entered validation',
              (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(home: CreateAccountDetailsScreen(user: user)));

            var _companyNameTextField = find
                .byKey(ValueKey('create-account-details-company-name-field'));

            await tester.enterText(_companyNameTextField, mockLongShortText);
            await tester.pumpAndSettle();

            await _tapFindMatchesButton(tester);

            //Finds wallet address validated message
            final _companyNameValidatedMessage = find.text(
                Constants.PLEASE_ENTER_SHORT_TEXT_WITH_LESS_THAN_FORTY_CHARS(
                    'company name'));

            //Finds validated messages within the text field
            final _companyValidationText = find
                .descendant(
                    of: _companyNameTextField,
                    matching: _companyNameValidatedMessage)
                .first
                .evaluate()
                .single
                .widget as Text;

            //Verify correct validation messaged is displayed
            expect(
                _companyValidationText.data,
                Constants.PLEASE_ENTER_SHORT_TEXT_WITH_LESS_THAN_FORTY_CHARS(
                    'company name'),
                reason:
                    'Job title validation text: ${_companyValidationText.data}');
          });
        });
      });
    });
  });
}
