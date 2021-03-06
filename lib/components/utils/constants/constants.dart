import 'package:flutter/material.dart';

class Constants {
  //Colors
  static const Color background_color = Color(0xff0c0c21);
  static const Color medium_blue = Color(0xff31314A);
  static const Color dark_blue = Color(0xff14142f);
  static const Color navy_blue = Color(0xff181843);
  static const Color indigo = Color(0xff6f25fe);
  static const Color blue_violet = Color(0xff852bf3);
  static const Color purple = Color(0xffb33fea);
  static const Color pink = Color(0xffff00ff);
  static const Color blue_jeans = Color(0xff52a9f2);
  static const Color sky_blue = Color(0xff59d2f5);
  static const Color neon_green = Color(0xff24FF00);
  static const Color neon_red = Color(0xffFF3E3E);
  static const Color neon_yellow = Color(0xffFFE500);
  static const Color thumb_color = Color(0xff494992);
  static const Color track_color = Color(0xff272763);

  //Strings(Language translation use)
  static const String NO_MATCHES_CURRENTLY = 'You currently have no matches.';
  static const String NO_MORE_USERS_MESSAGE =
      'No users left under your filter parameters';
  static const String I_AM_LOOKING_FOR = 'I am looking for...';
  static const String I_PREFER = 'I prefer';
  static const String UNKNOWN_ERROR = 'Unknown error';
  static const String UNKNOWN_ERROR_MESSAGE =
      'Please keep note of how you got this error and contact support.';
  static const String EMAIL_ALREADY_IN_USE = 'Email address already used';
  static const String EMAIL_ALREADY_IN_USE_MESSAGE =
      'Please navigate back and enter another email address';
  static const String INVALID_EMAIL_ADDRESS = 'Invalid email address';
  static const String INVALID_EMAIL_ADDRESS_MESSAGE =
      'Please make sure you entered your email correctly and there are no spaces.';
  static const String OPERATION_NOT_ALLOWED = 'Operation Invalid';
  static const String OPERATION_NOT_ALLOWED_MESSAGE =
      'Operation Invalid. Please try again later.';
  static const String REQUIRES_RECENT_LOGIN = 'User not logged in';
  static const String REQUIRES_RECENT_LOGIN_MESSAGE =
      'Please restart the app and login again';
  static const String TOO_MANY_REQUESTS = 'Too many failed attempts';
  static const String TOO_MANY_REQUESTS_MESSAGE =
      'Please wait a minute and try again.';
  static const String USER_DISABLED = 'Account disabled';
  static const String USER_DISABLED_MESSAGE =
      'This account has been disabled. Please contact support to enable it.';
  static const String USER_NOT_FOUND_EXCEPTION = 'User not found';
  static const String USER_NOT_FOUND_EXCEPTION_MESSAGE =
      'Please use different details and try again.';
  static const String WEAK_PASSWORD = 'Password is too weak';
  static const String WEAK_PASSWORD_MESSAGE =
      'Please enter another password that is more secure.';
  static const String WRONG_PASSWORD = 'Incorrect Email or Password';
  static const String WRONG_PASSWORD_MESSAGE =
      'Please enter the correct email or password, and try again.';
  static String RESET_PASSWORD = 'Reset Password';
  static String PASSWORD_RESET = 'Email sent';
  static String CHECK_YOUR_EMAIL =
      'Please check your email to reset your password.';
  static String EMAIL_ALREADY_EXISTS = 'Email already in use';
  static String PLEASE_ENTER_ANOTHER_EMAIL =
      'Please enter another email and try again.';
  static String NO_MATCHING_ADDRESSES =
      'The address you entered does not match the address in your wallet. Please try again.';
  static String ALGO_ADDRESS_ALREADY_EXISTS =
      'This Algo Address is already used. Please try another one or sign in.';
  static String SIGN_UP = 'Sign Up';
  static String SIGN_IN = 'Sign In';
  static String NEW_USER_IN_AREA = 'New users in your area';
  static String IN_APP_VIBRATIONS = 'In App Vibrations';
  static String IN_APP_SOUNDS = 'In App Sounds';
  static String NEW_MESSAGES = 'New Messages';
  static String NEW_MATCHES = 'New Matches';
  static String ONLY_SHOW_PEOPLE_IN_THIS_RANGE =
      'Only show people in this range';
  static String CHANGE = 'Change';
  static String SAVE = 'Save';
  static String AGE_SPAN = 'Age Span';
  static String SELECT_ONLY_ONE = 'Select only one';
  static String CHANGE_LOCATION = 'Change Your Location';
  static String MATCHING_DISTANCE = 'Matching Distance';
  static String DISTANCE_IN_MILES = 'Distance in Miles';
  static String LOCATION_SETTINGS = 'Location Settings';
  static String SIGN_IN_WITH = 'Sign In With';
  static String PERA = 'Pera';
  static String MORE = 'More';
  static String CONNECTED_ACCOUNTS = 'Connected Accounts';
  static String LOCATION = 'Location';
  static String IN_SEARCH_OF = 'In Search Of';
  static String PUSH_NOTIFICATIONS = 'Push Notifications';
  static String CONTACT_US = 'Contact Us';
  static String COMMUNITY_RULES = 'Community Rules';
  static String PRIVACY_POLICY = 'Privacy Policy';
  static String TERMS_OF_SERVICES = 'Terms of Services';
  static String LOG_OUT = 'Log Out';
  static String ADVANCED = 'Advanced';
  static String GENERAL_INFO = 'General Info';
  static String NO_THANKS = 'No Thanks';
  static String LET_ME_IN = 'Let me in';
  static String AMOUNT_OF_TRUST_TO_PLEDGE = 'Amount of Trust token to pledge';
  static String GET_TRUST = 'Get Trust';
  static String APR_OF_TRUST_TOKEN = 'APR of trust token is ';
  static String STAKE = 'Stake';
  static String UNSTAKE = 'Unstake';
  static String ENTER_AMOUNT_OF_TRUST = 'Enter amount of trust';
  static String TOKEN_STATS = 'Token Stats';
  static String PLATFORM_STATS = 'Platform Stats';
  static String YOUR_STATS = 'Your Stats';
  static String PURCHASE_ROLE_CONFIRMATION_MESSAGE(String roleTitle) =>
      'Are you sure that you want to purchase $roleTitle?';
  static String MY_ROLES = 'My Roles';
  static String PURCHASE_ROLE = 'Purchase Role';
  static String PURCHASE_ROLES = 'Purchase Roles';
  static String NONE = 'None';
  static String CURRENT_ROLE = 'Current Role';
  static String SOCIAL_SWAG = 'Social Swag';
  static String USERS = 'users';
  static String CHATTING_AS = 'Chatting as: ';
  static String GET_PERKS = 'Get Perks';
  static String GIFT_NOTIFICATION =
      'Someone wants to send you a gift! Click "open" to accept it and "toss" to send it back.';
  static String SAY_HELLO = 'Say Hi to';
  static String TYPE_A_MESSAGE = 'Type a message...';
  static String YOU_ARE_A_MATCHED_WITH = 'You are a match with';
  static String CHATS = 'Chats';
  static String NOTIFICATIONS = 'Notifications';
  static String COMING_SOON = 'Coming soon';
  static String REQUEST_A_VR_DATE = 'Request a VR Date';
  static String TOSS_GIFT_CONFIRMATION =
      'Are you sure you want to toss this gift?';
  static String UNMATCH_MESSAGE(String user) =>
      'Are you sure you want to unmatch with $user?';
  static String GIFT_RECEIVED_MESSAGE(String sender, String gift) =>
      '$sender sent you an $gift';
  static String GIFT_RECEIVED_ERROR_MESSAGE =
      'Something went wrong, please try the transaction again!';
  static String SEND = 'Send';
  static String SEND_ALGORAND = 'Send Algorand';
  static String ALGO = 'Algo';
  static String YOUR_BALANCE = 'Your Balance';
  static String GIFT_CONFIRMATION_MESSAGE(String receipient, String giftName) =>
      'Are you sure you want to send $giftName to $receipient?';
  static const String NFTS = 'NFTs';
  static const String TOKENS = 'Tokens';
  static const String CHOOSE_A_GIFT_TO_SEND = 'Choose a Gift to send';
  static const String YES = 'Yes';
  static const String NO = 'No';
  static const String PLEASE_SEARCH_FOR_SOMETHING =
      'Please search for something';
  static String SEND_AN_INVITE_DIALOG_MESSAGE(int trust) =>
      'Are you sure you want to use $trust Trust to send this invite?';
  static const String NEVERMIND = 'Nevermind';
  static const String SEND_AN_INVITE = 'Send an Invite';
  static const String ITS_A_MATCH_MESSAGE =
      "Slip into the metaverse through a TruYou portal! By using Trust tokens to stabilize the meta-field we guarantee safe passage for you and your potential partner";
  static const String ITS_A_MATCH = "It's a Match";
  static const String SHARE_PROFILE_NOW = 'Share profile now';
  static const String SHARED_IMAGES = 'Shared images';
  static const String COPY_WALLET_ADDRESS = 'Copy wallet address';
  static const String VERIFIED = 'Verified';
  static const String SEARCH = 'Search';
  static const String VIEW_PROFILE = 'View Profile';
  static const String START_CONVERSATION = 'Start Conversation';
  static const String SEND_USER_A_GIFT = 'Send a Gift';
  static const String UNMATCH = 'Unmatch';
  static const String HOME = 'Home';
  static const String MY_PROFILE = 'My Profile';
  static const String MY_MATCHES = 'My Matches';
  static const String PREMIUM_FEATURES = 'Premium Features';
  static const String PARTNERSHIPS = 'Partnerships';
  static const String SETTINGS = 'Settings';
  static const String PLEASE_ENTER_AMOUNT_MORE_THAN_0 =
      'Please enter amount more than 0';
  static const String PLEASE_ENTER_A_TRUST_AMOUNT =
      'Please enter a trust amount';
  static const String PLEASE_ENTER_AMOUNT_WITH_NO_ABNORMAL_CHARS =
      'Please enter amount with no "." or "-"';
  static const String AMOUNT_OF_TRUST = 'Amount of Trust token to pledge';
  static const String PLEDGE_RATIO = 'Pledging ratio is 1:1';
  static const String STAKE_TRUST = 'Stake Trust';
  static const String GO_SOCIAL = 'Go Social';
  static const String GO_SOCIAL_MESSAGE =
      "If you would rather feel out the platform before jumping into the web3 enabled features, that???s fine too!";
  static const String GO_SOCIAL_ACCESS_TO =
      "Click ???Go Social??? and you'll have access to";
  static const String THE_CONVERSATION = 'The Conversation';
  static const String GO_SOCIAL_BIG_OPEN_MESSENGER =
      'Which is one big open messenger that is accessible by all users of TruYou';
  static const String MATCH_STAKING_MESSAGE =
      'If you stake Trust within the Premium Account Staking contract, you will receive discounts on the cost to receive matches from the TruYou platform (All the way to 100% off)';
  static const String TOTAL_VOLUME_OF_TRUST = 'Total Volume of Locked Trust';
  static const String CURRENT_TRUST_APR = 'Current Trust APR: ';
  static const String PLEDGE_TRUST_MESSAGE =
      '??? If you would rather feel it out match by match, you???re welcome to pledge smaller amounts of Trust through ???Match Pledging???, though you will not have access to the benefits provided through the TruYou Premium Features section ???';
  static const String MATCH_STAKING = 'Match Staking';
  static const String PLEDGE_TRUST = 'Pledge Trust';
  static const String MATCH_PLEDGING_MESSAGE =
      'On the TruYou platform, in order to receive and interact with matches curated by the AI-driven architecture, a user is required to stake Trust tokens. This staking can take the form of either Match pledging or Premium Account Staking!';
  static const String MATCH_PLEDGING = 'Match Pledging';
  static const String DONE = 'done';
  static const String ATLEAST_TWO_IMAGES_REQUIRED =
      'Atleast two images required';
  static const String PLEASE_ADD_ATLEAST_TWO_IMAGES =
      'Please add atleast two images to proceed';
  static const String PLEASE_VERIFY_YOUR_WALLET =
      'Please tap on the verify wallet button to verify your wallet';
  static const String WALLET_NOT_VERIFIED = 'Wallet not verified';
  static const String LOCATION_NOT_ENABLED = 'Location not enabled';
  static const String PLEASE_ENABLE_YOUR_LOCATION =
      'Please tap on the enable location button to enable your location';
  static const String PLEASE_CONFIRM_YOUR_PASSWORD_AGAIN =
      'Please check that you confirmed your password correctly';
  static const String PASSWORDS_DONT_MATCH = "Passwords don't match";
  static const String YOU_NEED_TO_BE_OVER_18 =
      'Portals aren???t safe for those under the age of 18';
  static const String PORTALS_ARENT_SAFE = "Must be 18 to enter";
  static const String PLEASE_ENTER_A_DATE = 'Please select a date of birth';
  static const String DATE_NOT_ENTERED = 'No birth date selected';
  static const String TAP_TO_ENTER_DATE = 'Tap to select a date...';
  static const String OK = 'OK';
  static const String PLEASE_ENTER_AN_OTP_CODE = 'Please enter an OTP code';
  static const String NO_OTP_CODE = 'No OTP code entered';
  static const String FIND_MATCHES = 'Find Matches';
  static const String I_AM_A = 'I identify as...';
  static const String SEXUAL_ORIENTATION = 'Sexual orientation';
  static const String MY_SEXUAL_ORIENTATION_IS = 'My sexual orientation is...';
  static const String GENDER = 'Gender';
  static const String JOB_TITLE = 'Job title';
  static const String ENABLE_LOCATION = 'Enable location';
  static const String JOB = 'Job';
  static const String MY_LOCATION = 'My Location';
  static const String COMPANY = 'Company';
  static const String COMPANY_NAME = 'Company name';
  static const String LIFE_STYLE = 'Life Style';
  static const String LIFE_STYLE_MESSAGE =
      'Write something about your life style...';
  static const String WELCOME_MESSAGE = 'Welcome to TruYou';
  static const String CONTINUE_WITH_EMAIL = 'Continue with Email';
  static const String SIGN_IN_WITH_PERAWALLET = 'Sign-in with PeraWallet';
  static const String SIGN_IN_WITH_MYALGOWALLET = 'Sign-in with MyAlgoWallet';
  static const String SIGN_IN_WITH_PHONE_NUMBER = 'Sign-in with Phone Number';
  static const String SIGN_IN_MESSAGE = 'Sign In';
  static const String JUMP_IN_BUTTON_TEXT = "Jump In";
  static const String DONT_HAVE_ACCOUNT_TEXT = "Don't have an account? ";
  static const String CLICK_ME_TEXT = 'Click me';
  static const String BY_CLICKING_ON_ME_TEXT =
      'By clicking login, you agree to our ';
  static const String TERMS_OF_SERVICE_TEXT = 'Terms of Service';
  static const String AND_OUR_TEXT = ' and our ';
  static const String PRIVACY_POLICY_TEXT = 'Privacy Policy';
  static const String FORGOT_PASSWORD_CLICKABLE_TEXT = 'Forgot password?';
  static const String PASSWORD = 'Password';
  static const String EMAIL = 'Email';
  static const String CONTINUE_WITH_PHONE_NUMBER = 'Continue with Phone Number';
  static const String ENTER_COUNTRY_CODE_AND_NUMBER =
      'Please enter your country code and phone number';
  static const String GET_MY_OTP_CODE = 'Get my OTP code';
  static const String VERIFICATION = 'Verification';
  static const String CODE_WILL_BE_SENT_TO = 'Enter the code sent to you at ';
  static const String PHONE_NUMBER = 'Phone Number';
  static const String RESEND_CODE = 'Resend Code?';
  static const String NEXT = 'Next';
  static const String CREATE_AN_ACCOUNT = 'Create an account';
  static const String FIRST_NAME = 'First name';
  static const String LAST_NAME = 'Last name';
  static const String DATE_OF_BIRTH = 'Date of Birth';
  static const String DAY = 'DD';
  static const String MONTH = 'MM';
  static const String YEAR = 'YYYY';
  static const String CONFIRM_PASSWORD = 'Confirm Password';
  static const String ADD_PHOTOS = 'Add photos';
  static const String MINIMUM_TWO_PHOTOS = 'Minimum two photos';
  static const String ALGORAND_WALLET_ADDRESS = 'Algorand Wallet Address';
  static const String VERIFY = 'Verify';
  static const String ABOUT_ME = 'About me';
  static const String ABOUT_ME_MESSAGE = 'Tell us something about yourself...';
  static const String ENABLE_LOCATION_TO_USE_TRUYOU =
      "You'll need to enable your location to access TruYou";
  static const String LOCATION_NEEDED = 'Location required';

  //Image picker
  static const double BORDER_WIDTH = 2.0;
  static const int IMAGE_QUALITY = 80;
  static const double IMAGE_MAXHEIGHT = 1024.0;
  static const double IMAGE_MAXWIDTH = 1024.0;

  //Error messages - Validation
  static const String PLEASE_ENTER_AN_EMAIL = 'Please enter an email';
  static const String PLEASE_ENTER_A_VALID_EMAIL = 'Please enter a valid email';
  static const String PLEASE_ENTER_A_PASSWORD = 'Please enter a password';
  static const String PLEASE_ENTER_A_LONGER_PASSWORD =
      'Password must be 8 characters or longer';
  static String PLEASE_ENTER_A_LONG_TEXT(String type) =>
      'Please type something $type';
  static const String PLEASE_ENTER_A_LONG_TEXT_LONGER_THAN_THIRTY_CHARS =
      'Please enter more than 30 characters';
  static String PLEASE_ENTER_A_NAME(String nameOrLastName) =>
      'Please enter your $nameOrLastName';
  static String PLEASE_ENTER_NAME_WITH_ATLEAST_TWO_CHARACTERS(
          String nameOrLastName) =>
      '$nameOrLastName must be atleast 2 characters';
  static String PLEASE_ENTER_NAME_NO_LONGER_THAN_THIRTY_CHARACTERS(
          String nameOrLastName) =>
      '$nameOrLastName must not be longer than 30 chars';
  static String PLEASE_ENTER_A_VALID_NAME(String nameOrLastName) =>
      'Please enter a valid $nameOrLastName';
  static const String PLEASE_ENTER_A_PHONE_NUMBER =
      'Please enter your phone number';
  static const String PLEASE_ENTER_PHONE_NUMBER_WITH_TEN_DIGITS =
      'Please enter a phone number with 10 digits';
  static String PLEASE_ENTER_A_SHORT_TEXT(String type) =>
      'Please enter a $type';
  static String PLEASE_ENTER_SHORT_TEXT_WITH_LESS_THAN_FORTY_CHARS(
          String type) =>
      'Your $type must not be longer than 40 characters';
  static const String PLEASE_ENTER_A_WALLET_ADDRESS =
      'Please enter a wallet address';
  static const String PLEASE_ENTER_ADDRESS_EQUAL_TO_FIFTY_EIGHT_CHARS =
      'Your wallet address should have 64 characters';
  static const String PLEASE_ENTER_AN_OTP_VERIFICATION_CODE =
      'Please enter an OTP Code';
  static const String PLEASE_ENTER_A_FOUR_DIGIT_OTP_CODE =
      'Please enter a 4 digit OTP code';
  static const String ABOUT_YOURSELF = 'about yourself';
  static const String ABOUT_YOUR_LIFESTYLE = 'about your lifestyle';

  //Constant lists
  static const List<String?> genders = <String?>['Female', 'Male', 'Everyone'];
  static const List<String?> sexual_orientation = <String?>[
    'Straight',
    'Gay',
    'Bisexual',
    'Transgender',
    'Other'
  ];
  static const List<String> months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
}
