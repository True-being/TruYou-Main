import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/my_matches_card.dart';
import 'package:truyou/models/auth_user_model.dart';
import 'package:truyou/screens/app_root.dart';
import 'package:truyou/screens/chats/messages/tab_view.dart';
import 'package:truyou/screens/gift-screens/choose_gift_screen.dart';
import 'package:truyou/screens/gift-screens/send-gift-screens/nft_gift.dart';
import 'package:truyou/screens/go-social/go_social.dart';
import 'package:truyou/screens/go-social/roles/purchase_role.dart';
import 'package:truyou/screens/go-social/roles/social_swag.dart';
import 'package:truyou/screens/match-pledging/match_pledging_screen.dart';
import 'package:truyou/screens/screens.dart';
import 'package:flutter_test/flutter_test.dart';

//TODO: Create dialog router tester
//TODO: Create dialog error tester

///Contains all the apps keys(Mostly buttons)
class Keys {
  //*Welcome screen
  static const emailLogin = 'email-login';
  static const perraWalletLogin = 'pera-wallet-login';
  static const myAlgorandWalletLogin = 'my-algo-wallet-login';
  static const myPhoneNumberLogin = 'phone-number-login';
  //*Sign in with email screen
  static const signInWithEmailbackToWelcomeScreen = 'back-to-welcome-screen';
  static const signInWithEmailJumpInButton = 'jump-in-button';
  //*Sign in with phone number screen
  static const signInWithPhoneNumberbackToWelcomeScreen =
      'sign-in-with-phone-number-back-button';
  static const getMyOTPCodeButton = 'get-my-otp-code-button';
  //*OTP Verification screen
  static const otpVerificationBackButton = 'otp-verification-back-button';
  static const otpVerificationNextButton = 'otp-verification-next-button';
  //*Create account general screen
  static const createAccountGeneralBackButton =
      'create-account-general-back-button';
  static const createAccountGeneralNextButton =
      'create-account-general-next-button';
  //*Create account details screen
  static const createAccountDetailsBackButton =
      'create-account-details-back-button';
  static const createAccountDetailsFindMatchesButton =
      'create-account-details-find-matches';
  //*Match pledging
  static const matchPledgingGoSocialButton = 'match-pledge-go-social-button';
  static const matchPledgingPledgeTrustButton = 'pledge-trust-button';
  //*Home
  static const findMatchesChatBubbleButton = 'find-matches-chat-bubble-button';
  static const chatsTabViewBackButton = 'chats-tab-view-back-button';
  static const findMatchesMenuButton = 'find-matches-menu-button';
  //*Drawer
  static const drawerCloseButton = 'drawer-close-button';
  static const drawerMyMatchesButton = 'drawer-my-matches-button';
  static const drawerMyProfileButton = 'drawer-my-profile-button';
  static const drawerPremiumFeaturesButton = 'drawer-premium-features-button';
  static const drawerGoSocialButton = 'drawer-go-social-button';
  static const drawerPartnershipsButton = 'drawer-partnership-button';
  static const drawerSettingsButton = 'drawer-settings-button';

  //*Match option dialog
  static const matchOptionsViewProfileButton =
      'match-options-view-profie-button';
  static const matchOptionStartConversationButton =
      'match-options-start-conversation-button';
  static const matchOptionSendUserAGiftButton =
      'match-option-send-user-a-gift-button';
  static const matchOptionsUnmatchButton = 'match-option-unmatch-button';
  //*User profile
  static const userProfileBackButton = 'user-profile-back-button';
  //*Start conversation
  static const startConversationBackButton = 'start-conversation-back-button';
  //*Send a gift to user
  static const sendTheUserAGiftBackButton = 'send-the-user-a-gift-back-button';
  //*Unmatch dialog
  static const confirmUnmatchDialogMessage = 'confirm-unmatch-dialog-message';
  //*Social swag
  static const socialSwagBackButton = 'social-swag-back-button';
  static const getPerksButton = 'get-perks-button';
  //*NFT gift
  static const nftGiftBackButton = 'nft-gift-back-button';
  //*Purchase Role
  static const purchaseRoleBackButton = 'purchase-role-back-button';
}

///Fields contains all the apps textfields and validates them
class Fields {
  //*Sign in with email textfields
  static const emailPasswordSignInEmailKey = TextFieldKey(
      key: 'email-sign-in-email-field',
      enter: 'test@gmail.com',
      validators: [
        {'': Constants.PLEASE_ENTER_AN_EMAIL},
        {'test@@gmail.com': Constants.PLEASE_ENTER_A_VALID_EMAIL}
      ]);
  static const emailPasswordSignInPasswordKey = TextFieldKey(
    key: 'email-sign-in-password-field',
    enter: '1234567890',
    validators: [
      {'': Constants.PLEASE_ENTER_A_PASSWORD},
      {'123': Constants.PLEASE_ENTER_A_LONGER_PASSWORD}
    ],
  );

  //*Sign in with phone number textfields
  static const phoneNumberSignInNumberKey = TextFieldKey(
    key: 'phone-number-text-field',
    enter: '0624903032',
    validators: [
      {
        '': Constants.PLEASE_ENTER_A_PHONE_NUMBER,
      },
      {
        '086': Constants.PLEASE_ENTER_PHONE_NUMBER_WITH_TEN_DIGITS,
      }
    ],
  );

  //*OTP code pin input
  static const otpVerificationPinInput = TextFieldKey(
      key: 'otp-verification-pin-input',
      enter: '7777',
      validators: [
        {
          '': Constants.PLEASE_ENTER_AN_OTP_VERIFICATION_CODE,
        },
        {'01': Constants.PLEASE_ENTER_A_FOUR_DIGIT_OTP_CODE},
      ]);

  static var createAccountGeneralFirstNameKey = TextFieldKey(
      key: 'create-account-general-first-name',
      enter: 'Mark',
      validators: [
        {'': Constants.PLEASE_ENTER_A_NAME(Constants.FIRST_NAME)},
        {
          'A': Constants.PLEASE_ENTER_NAME_WITH_ATLEAST_TWO_CHARACTERS(
              Constants.FIRST_NAME)
        },
        {
          'superlongnamewithextracharsthatmakeitsuperlong':
              Constants.PLEASE_ENTER_NAME_NO_LONGER_THAN_THIRTY_CHARACTERS(
                  Constants.FIRST_NAME)
        },
        {'%jargon%': Constants.PLEASE_ENTER_A_VALID_NAME(Constants.FIRST_NAME)}
      ]);

  static var createAccountGeneralLastNameKey = TextFieldKey(
      key: 'create-account-general-last-name',
      enter: 'Zuckerurg',
      validators: [
        {'': Constants.PLEASE_ENTER_A_NAME(Constants.LAST_NAME)},
        {
          'D': Constants.PLEASE_ENTER_NAME_WITH_ATLEAST_TWO_CHARACTERS(
              Constants.LAST_NAME)
        },
        {
          'superlonglastnamewithextracharsthatmakeitsuperlong':
              Constants.PLEASE_ENTER_NAME_NO_LONGER_THAN_THIRTY_CHARACTERS(
                  Constants.LAST_NAME)
        },
        {'%ragon%': Constants.PLEASE_ENTER_A_VALID_NAME(Constants.LAST_NAME)}
      ]);

  static const createAccountGeneralEmailKey = TextFieldKey(
      key: 'create-account-general-email',
      enter: 'test@gmail.com',
      validators: [
        {'': Constants.PLEASE_ENTER_AN_EMAIL},
        {'test@@gmail.com': Constants.PLEASE_ENTER_A_VALID_EMAIL}
      ]);

  static const createAccountGeneralPassword = TextFieldKey(
      key: 'create-account-general-password',
      enter: 'test12345',
      validators: [
        {'': Constants.PLEASE_ENTER_A_PASSWORD},
        {'123': Constants.PLEASE_ENTER_A_LONGER_PASSWORD}
      ]);

  static const createAccountGeneralConfirmPassword = TextFieldKey(
      key: 'create-account-general-confirm-password',
      enter: 'test12345',
      validators: [
        {'': Constants.PLEASE_ENTER_A_PASSWORD},
        {'123': Constants.PLEASE_ENTER_A_LONGER_PASSWORD}
      ]);

  static const createAccountDetailsWalletAddress = TextFieldKey(
      key: 'create-account-details-wallet-address',
      enter: 'ENF2IFN238UYGH23YGH84HG7849HG284NG2H48G908824HG79240WERGFN2Y83D3',
      validators: [
        {'': Constants.PLEASE_ENTER_A_WALLET_ADDRESS},
        {'XYZ': Constants.PLEASE_ENTER_ADDRESS_EQUAL_TO_SIXTY_FOUR_CHARS},
      ]);

  static var createAccountDetailsAboutMe = TextFieldKey(
      key: 'create-account-details-about-me-field',
      enter:
          'Hello! I am an interesting individual. I love climbing rock face with no ropes lol',
      validators: [
        {'': Constants.PLEASE_ENTER_A_LONG_TEXT(Constants.ABOUT_YOURSELF)},
        {'hello': Constants.PLEASE_ENTER_A_LONG_TEXT_LONGER_THAN_THIRTY_CHARS}
      ]);

  static var createAccountDetailsLifeStyle = TextFieldKey(
      key: 'create-account-details-life-style-field',
      enter:
          'I live life on the edge! Quite literally... Falling is not an option.',
      validators: [
        {
          '': Constants.PLEASE_ENTER_A_LONG_TEXT(Constants.ABOUT_YOUR_LIFESTYLE)
        },
        {'hello': Constants.PLEASE_ENTER_A_LONG_TEXT_LONGER_THAN_THIRTY_CHARS}
      ]);

  static var createAccountDetailsJobTitle = TextFieldKey(
      key: 'create-account-details-job-title-field',
      enter: 'Phone breaker',
      validators: [
        {'': Constants.PLEASE_ENTER_A_SHORT_TEXT(Constants.JOB_TITLE)},
        {
          'THIS IS A REALLY LONG JOB WHICH HAS A LOT OF WORK AND IS WAY TO LONG':
              Constants.PLEASE_ENTER_SHORT_TEXT_WITH_LESS_THAN_FORTY_CHARS(
                  Constants.JOB_TITLE)
        },
      ]);

  static var createAccountDetailsCompany = TextFieldKey(
      key: 'create-account-details-company-name-field',
      enter: 'Feta',
      validators: [
        {'': Constants.PLEASE_ENTER_A_SHORT_TEXT(Constants.COMPANY_NAME)},
        {
          'THIS AS AN EVEN LONGER TEXT FOR A COMPANY NAME OF FETA INC':
              Constants.PLEASE_ENTER_SHORT_TEXT_WITH_LESS_THAN_FORTY_CHARS(
                  Constants.COMPANY_NAME)
        }
      ]);

  static const matchPledgingPledgeTrustField = TextFieldKey(
    key: 'pledge-trust-textfield',
    enter: '01',
    validators: [
      {'': Constants.PLEASE_ENTER_A_TRUST_AMOUNT},
      {'1.-0': Constants.PLEASE_ENTER_AMOUNT_WITH_NO_ABNORMAL_CHARS},
      {'00': Constants.PLEASE_ENTER_AMOUNT_MORE_THAN_0}
    ],
  );

  static void testAll() {
    //*Sign in with email - Email validation
    AutoValidate(
        screen: const SignInEmailScreen(),
        activatorKey: Keys.signInWithEmailJumpInButton,
        textfield: emailPasswordSignInEmailKey)
      ..test();
    //*Sign in with email - Password validation
    AutoValidate(
        screen: const SignInEmailScreen(),
        activatorKey: Keys.signInWithEmailJumpInButton,
        textfield: emailPasswordSignInPasswordKey)
      ..test();

    //*Sign in with phone number validation
    AutoValidate(
        screen: const SignInPhoneNumber(),
        activatorKey: Keys.getMyOTPCodeButton,
        textfield: phoneNumberSignInNumberKey)
      ..test();

    //*Otp Verifcation pin put
    //TODO: Create otp verification test

    //*Create account general First name validation
    AutoValidate(
        screen: const CreateAccountGeneralScreen(),
        activatorKey: Keys.createAccountGeneralNextButton,
        textfield: createAccountGeneralFirstNameKey)
      ..test();

    //*Create account general Last name validation
    AutoValidate(
        screen: const CreateAccountGeneralScreen(),
        activatorKey: Keys.createAccountGeneralNextButton,
        textfield: createAccountGeneralLastNameKey)
      ..test();

    //*Create account general email validation
    AutoValidate(
        screen: const CreateAccountGeneralScreen(),
        activatorKey: Keys.createAccountGeneralNextButton,
        textfield: createAccountGeneralEmailKey)
      ..test();

    //*Create account general password
    AutoValidate(
        screen: const CreateAccountGeneralScreen(),
        activatorKey: Keys.createAccountGeneralNextButton,
        textfield: createAccountGeneralPassword)
      ..test();

    //*Create account general confirm password
    AutoValidate(
        screen: const CreateAccountGeneralScreen(),
        activatorKey: Keys.createAccountGeneralNextButton,
        textfield: createAccountGeneralConfirmPassword)
      ..test();

    //TODO: Fix create accounts details -> Loading screen loading of data
    // //*Create account details wallet address
    // AutoValidate(
    //     screen: CreateAccountDetailsScreen(user: _mockUser),
    //     activatorKey: Keys.createAccountDetailsFindMatchesButton,
    //     textfield: Fields.createAccountDetailsWalletAddress)
    //   ..test();

    // //*Create account details about me
    // AutoValidate(
    //     screen: CreateAccountDetailsScreen(user: _mockUser),
    //     activatorKey: Keys.createAccountDetailsFindMatchesButton,
    //     textfield: Fields.createAccountDetailsAboutMe)
    //   ..test();

    // //*Create account details lifestyle
    // AutoValidate(
    //     screen: CreateAccountDetailsScreen(user: _mockUser),
    //     activatorKey: Keys.createAccountDetailsFindMatchesButton,
    //     textfield: Fields.createAccountDetailsLifeStyle)
    //   ..test();

    // //*Create account details job title
    // AutoValidate(
    //     screen: CreateAccountDetailsScreen(user: _mockUser),
    //     activatorKey: Keys.createAccountDetailsFindMatchesButton,
    //     textfield: createAccountDetailsJobTitle)
    //   ..test();

    // //*Create account details company
    // AutoValidate(
    //     screen: CreateAccountDetailsScreen(user: _mockUser),
    //     activatorKey: Keys.createAccountDetailsFindMatchesButton,
    //     textfield: createAccountDetailsCompany)
    //   ..test();

    //*Match Pledging Pledge trust
    AutoValidate(
        screen: MatchPledging(),
        activatorKey: Keys.matchPledgingPledgeTrustButton,
        textfield: matchPledgingPledgeTrustField)
      ..test();
  }
}

///Routes contains all app routes and the tests to verify navigation
class Routes {
  static const welcomeScreen = '/welcome-screen';
  static const signInEmailScreen = '/email-sign-in';
  static const signInPhoneNumberScreen = '/phone-number-sign-in';
  static const home = '/app-root';
  static const otpVerificationScreen = '/otp-verification';
  static const createAccountGeneralScreen = '/create-account-general-screen';
  static const createAccountDetailsScreen = '/create-account-details-screen';
  static const chats = '/chats';
  static const matchOptionDialog = '/match-option-dialog';
  static const chatViewer = '/chat-viewer';
  static const confirmTossDialog = '/confirm-toss-dialog';
  static const unmatchUserDialog = '/match-unmatch-dialog';
  static const itsAMatchScreen = '/its-a-match-screen';
  static const socialSwag = '/social-swag';
  static const purchaseRole = '/purchase-role';
  static const confirmPurchaseRoleDialog = '/confirm-purchase-role-dialog';

  static void testAll() {
    //!Welcome screen routing
    //*Navigate to sign in with email and password
    AutoRoute(
      screen: const WelcomeScreen(),
      process: [],
      activatorKey: Keys.emailLogin,
      destination: signInEmailScreen,
      navType: NavType.push,
    )..test();

    //*Navigate to sign in with phone number
    AutoRoute(
        screen: const WelcomeScreen(),
        process: [],
        activatorKey: Keys.myPhoneNumberLogin,
        destination: signInPhoneNumberScreen,
        navType: NavType.push)
      ..test();

    //!Sign in with email screen routing
    //*Pop to welcome screen
    AutoRoute(
        screen: const SignInEmailScreen(),
        process: [],
        activatorKey: Keys.signInWithEmailbackToWelcomeScreen,
        destination: welcomeScreen,
        navType: NavType.pop)
      ..test();
    //*Navigate to home screen from sign in with email and password
    AutoRoute(
        screen: const SignInEmailScreen(),
        process: [
          Fields.emailPasswordSignInEmailKey,
          Fields.emailPasswordSignInPasswordKey
        ],
        activatorKey: Keys.signInWithEmailJumpInButton,
        destination: home,
        navType: NavType.pushAndRemoveUntil)
      ..test();

    //!Sign in with phone number screen routing
    //*Pop to welcome screen from sign in with phone number
    AutoRoute(
        screen: const SignInPhoneNumber(),
        process: [],
        activatorKey: Keys.signInWithPhoneNumberbackToWelcomeScreen,
        destination: welcomeScreen,
        navType: NavType.pop)
      ..test();

    //*Navigate to OTP vertification from Sign in with phone number
    AutoRoute(
        screen: const SignInPhoneNumber(),
        process: [Fields.phoneNumberSignInNumberKey],
        activatorKey: Keys.getMyOTPCodeButton,
        destination: otpVerificationScreen,
        navType: NavType.push)
      ..test();

    //!OTP verification screen routing
    //*Navigate to otp verification
    AutoRoute(
        screen: const OTPVerficationScreen(
            countryCode: '+1', phoneNumber: '8063294422'),
        process: [Fields.otpVerificationPinInput],
        activatorKey: Keys.otpVerificationNextButton,
        destination: createAccountGeneralScreen,
        navType: NavType.pushAndRemoveUntil)
      ..test();

    //*Pop to sign in with phone number
    AutoRoute(
        screen: const OTPVerficationScreen(
            countryCode: '+1', phoneNumber: '8063294422'),
        process: [],
        activatorKey: Keys.otpVerificationBackButton,
        destination: signInPhoneNumberScreen,
        navType: NavType.pop)
      ..test();

    //!Create account general and Create account details
    //TODO: Create navigate to next screen tests for both of these screens
    //*Pop to Welcome screen
    AutoRoute(
        screen: const CreateAccountGeneralScreen(),
        process: [],
        activatorKey: Keys.createAccountGeneralBackButton,
        destination: welcomeScreen,
        navType: NavType.pop)
      ..test();
    //*Pop to Create account general screen
    //!Late intialization error
    // AutoRoute(
    //     screen: CreateAccountDetailsScreen(user: _mockUser),
    //     process: [],
    //     activatorKey: Keys.createAccountDetailsBackButton,
    //     destination: createAccountGeneralScreen,
    //     navType: NavType.pop)
    //   ..test();

    //TODO: Add error dialogs routing for these screens

    //!Match pledging
    //TODO: Create swipe to access all cards

    //!Chats
    //*Navigate to chats from home
    AutoRoute(
        screen: const AppRoot(),
        process: [],
        activatorKey: Keys.findMatchesChatBubbleButton,
        destination: chats,
        navType: NavType.push)
      ..test();

    //*Pop from chats to home
    AutoRoute(
        screen: const ChatsTabView(),
        process: [],
        activatorKey: Keys.chatsTabViewBackButton,
        destination: home,
        navType: NavType.pop)
      ..test();

    //*Navigate to a gift on Choose a Gift screen
    //TODO: Change auto route to cater for find.byType(Card).first

    //*Pop from Choose a gift to home
    AutoRoute(
        screen: ChooseGiftScreen(receipient: 'Leo'),
        process: [],
        activatorKey: Keys.sendTheUserAGiftBackButton,
        destination: home,
        navType: NavType.pop)
      ..test();

    //*Pop from social swag
    AutoRoute(
        screen: SocialSwag(),
        process: [],
        activatorKey: Keys.socialSwagBackButton,
        destination: home,
        navType: NavType.pop)
      ..test();

    //*Pop from purchase role
    AutoRoute(
        screen: PurchaseRole(title: 'title', imageURL: 'assets/women1.jpg'),
        process: [],
        activatorKey: Keys.purchaseRoleBackButton,
        destination: home,
        navType: NavType.pop)
      ..test();

    //*Pop from NFT Gift screen
    AutoRoute(
        screen: NFTGiftScreen(
          title: 'title',
          receipient: 'receipient',
          imagePath: 'assets/women1.jpg',
        ),
        process: [],
        activatorKey: Keys.nftGiftBackButton,
        destination: home,
        navType: NavType.pop)
      ..test();

    //*Navigate to purchase role
    //TODO: Change auto route to cater for find.byType(Card).first

    //*Navigate to social swag
    AutoRoute(
        screen: const GoSocial(),
        process: [],
        activatorKey: Keys.getPerksButton,
        destination: socialSwag,
        navType: NavType.push)
      ..test();
  }
}

///Tests all the drawer routes and verifies they routed to a different screen
class DrawerRoutes {
  static void testAll() {
    //Close button
    AutoDrawerRoute.test(Keys.drawerCloseButton, null);
    //My profile
    AutoDrawerRoute.test(Keys.drawerMyProfileButton, Constants.VERIFIED);
    //My matches
    AutoDrawerRoute.test(Keys.drawerMyMatchesButton, Constants.SEARCH);
    //Go social //TODO: Add a verify tag
    AutoDrawerRoute.test(Keys.drawerGoSocialButton, null);
    //Premium features//TODO: Add a verify tag
    AutoDrawerRoute.test(Keys.drawerPremiumFeaturesButton, null);
    //Partnerships//TODO: Add a verify tag
    AutoDrawerRoute.test(Keys.drawerPartnershipsButton, null);
    //Settings//TODO: Add a verify tag
    AutoDrawerRoute.test(Keys.drawerSettingsButton, null);
  }
}

///Verifies all the match options buttons
///Navigate to the correct screen
class MatchOptionsDialog {
  static void _openMatchOptionsDialog(WidgetTester tester) async {
    final _matchCard = find.byType(MyMatchesCard).first;

    expect(_matchCard, findsOneWidget);

    await tester.ensureVisible(_matchCard);
    await tester.pumpAndSettle();
    await tester.tap(_matchCard);
    await tester.pumpAndSettle();
  }

  static void _navigateToScreen(WidgetTester tester,
      String matchOptionButtonKey, String verificationKey) async {
    final _matchOptionButton = find.byKey(ValueKey(matchOptionButtonKey));

    expect(_matchOptionButton, findsOneWidget);

    await tester.ensureVisible(_matchOptionButton);
    await tester.pumpAndSettle();
    await tester.tap(_matchOptionButton);
    await tester.pumpAndSettle();

    final _verify = find.byKey(ValueKey(verificationKey));
    await tester.ensureVisible(_verify);
    await tester.pumpAndSettle();

    expect(_verify, findsOneWidget);
  }

  static void testAll() {
    //View profile
    AutoDrawerRoute.navigateTo(
        'Navigate View profile from match options dialog',
        Keys.drawerMyMatchesButton, [
      (tester) => _openMatchOptionsDialog(tester),
      (tester) => _navigateToScreen(tester, Keys.matchOptionsViewProfileButton,
          Keys.userProfileBackButton)
    ]);
    //Start conversation
    AutoDrawerRoute.navigateTo(
        'Navigate to Start conversation from match options dialog',
        Keys.drawerMyMatchesButton, [
      (tester) => _openMatchOptionsDialog(tester),
      (tester) => _navigateToScreen(
          tester,
          Keys.matchOptionStartConversationButton,
          Keys.startConversationBackButton)
    ]);
    //Send the user a gift
    AutoDrawerRoute.navigateTo(
        'Navigate to Send the user a gift from match options dialog',
        Keys.drawerMyMatchesButton, [
      (tester) => _openMatchOptionsDialog(tester),
      (tester) => _navigateToScreen(tester, Keys.matchOptionSendUserAGiftButton,
          Keys.sendTheUserAGiftBackButton)
    ]);
    //Unmatch
    AutoDrawerRoute.navigateTo(
        'Unmatch user from match options dialog', Keys.drawerMyMatchesButton, [
      (tester) => _openMatchOptionsDialog(tester),
      (tester) => _navigateToScreen(tester, Keys.matchOptionsUnmatchButton,
          Keys.confirmUnmatchDialogMessage)
    ]);
  }
}

///Super textfield object - Store a textfields key and all its validations
class TextFieldKey {
  final String key;
  final String enter;
  final List<Map<String, String>> validators;

  const TextFieldKey(
      {required this.key, required this.enter, required this.validators});
}

final _mockUser = AuthUser(
    firstName: 'Mark',
    lastName: 'Zuckerburg',
    email: 'ZuckMuck@gmail.com',
    companyName: 'Feta',
    photos: [],
    aboutMe: 'wjghkjwehgkwhjkeghwegjwkle wjhegwhejlghwehjglwk helj',
    algoWalletAddress: 'hewghH3UIHG2G942GHU249GH2849G22948GH',
    birthDate: DateTime(1000, 01, 01),
    gender: 'Other',
    job: 'Stealing data',
    lifeStyle: 'wjgkhwrglwlrjg lwrjlgkjwkrljgkljwlrjglwlkrgj',
    location: LatLng(23.045, 34.234),
    password: 'secure12345',
    sexualOrientation: 'ROBOTS');
