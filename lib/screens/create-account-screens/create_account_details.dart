import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:truyou/bloc/auth_bloc/auth_bloc.dart';
import 'package:truyou/components/components.dart';
import 'package:location/location.dart' as location;
import 'package:truyou/components/utils/exceptions/exception_handler.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/components/widgets/loader.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/repository/cloud_function_repository.dart';
import 'package:truyou/repository/wallet_repository.dart';
import 'package:truyou/screens/match-pledging/match_pledging_screen.dart';
import 'package:truyou/services/image_picker_service.dart';

//File number - Used to identify the file being changed
enum FNum { FIRST, SECOND, THIRD, FOURTH, FIFTH, SIXTH }

class CreateAccountDetailsScreen extends StatefulWidget {
  final TruYouUser user;
  final String password;

  static Route route(TruYouUser authUser, String password) {
    return MaterialPageRoute(
      builder: (_) =>
          CreateAccountDetailsScreen(user: authUser, password: password),
      settings: const RouteSettings(name: Routes.createAccountDetailsScreen),
    );
  }

  const CreateAccountDetailsScreen(
      {Key? key, required this.user, required this.password})
      : super(key: key);

  @override
  State<CreateAccountDetailsScreen> createState() =>
      _CreateAccountDetailsScreenState();
}

class _CreateAccountDetailsScreenState
    extends State<CreateAccountDetailsScreen> {
  //Image Picker Service Instance
  ImagePickerService _imagePickerService = ImagePickerService();

  //The six images
  File? _mainImage;
  File? _secondaryImage;
  File? _thirdImage;
  File? _fourthImage;
  File? _fifthImage;
  File? _sixthImage;

  //Text controllers
  TextEditingController _walletAddressController = TextEditingController();
  TextEditingController _aboutMeController = TextEditingController();
  TextEditingController _lifeStyleController = TextEditingController();
  TextEditingController _jobTitleController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();

  //Blocs
  final _signUpBloc = getit<AuthBloc>();
  final _cloudFunctionRepository = getit<CloudFunctionRepository>();

  //Gender
  String? _gender = Constants.genders[0];
  String? _genderPreference = Constants.genders[1];
  //Sexual Orientation
  String? _sexualOrientation = Constants.sexual_orientation[0];
  String? _sexualOrientationPreference = Constants.sexual_orientation[0];

  //Age Range
  final _lowerAgePreference = DateTime.now()..subtract(Duration(days: 6570));
  final _upperAgePreference = DateTime.now()..subtract(Duration(days: 12775));

  final _radiusDistance = 0;

  final _loadingKey = GlobalKey<State>();

  //Form key - Validation
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Prevents constant spam of request permission
  bool _onRequest = false;

  //Checks if user has granted the permission for location
  bool _hasRequested = false;

  //Checks if wallet has been verified - Checks if wallet exists in the Database
  bool _hasVerifiedWallet = true;

  //The current location of the user
  Location? _currentLocation;
  //The controller of the static map
  StaticMapController? _controller;

  void _allowLocationPermission() async {
    if (!_onRequest) {
      //Requests the location permission
      var status = await Permission.location.request();
      //Checks if permission was granted
      if (status.isGranted) {
        //TODO:Potential bug - Tablet
        location.Location _locationIstance = location.Location();
        //Gets the users current location
        location.LocationData _location = await _locationIstance.getLocation();
        setState(() {
          _onRequest = true;
          _hasRequested = true;
          //Sets the users current location
          _currentLocation =
              Location(_location.latitude!, _location.longitude!);
          //Updates the screen with market
          _controller = StaticMapController(
              googleApiKey: FlutterConfig.get('GOOGLE_MAPS_API_KEY'),
              width: 400,
              height: 400,
              zoom: 10,
              center: Location(_location.latitude!, _location.longitude!),
              markers: [
                Marker(
                    locations: [_currentLocation!],
                    color: Colors.red,
                    size: MarkerSize.mid)
              ]);
        });
      }
    } else {
      CustomDialog.showBasicDialog(context, Constants.LOCATION_NEEDED,
          Constants.ENABLE_LOCATION_TO_USE_TRUYOU, '/location-needed');
    }
  }

  void _selectImageFromGallery(FNum fnum) async {
    File? _croppedImage = await _imagePickerService.pickImage();

    //Sets the image selected to the current cropped image
    switch (fnum) {
      case FNum.FIRST:
        setState(() {
          _mainImage = _croppedImage;
        });
        break;
      case FNum.SECOND:
        setState(() {
          _secondaryImage = _croppedImage;
        });
        break;
      case FNum.THIRD:
        setState(() {
          _thirdImage = _croppedImage;
        });
        break;
      case FNum.FOURTH:
        setState(() {
          _fourthImage = _croppedImage;
        });
        break;
      case FNum.FIFTH:
        setState(() {
          _fifthImage = _croppedImage;
        });
        break;
      case FNum.SIXTH:
        setState(() {
          _sixthImage = _croppedImage;
        });
        break;
    }
  }

  void _verifyAddress(BuildContext context) async {
    if (_walletAddressController.text.isNotEmpty) {
      if (!(await _cloudFunctionRepository
          .doesAddressAlreadyExist(_walletAddressController.text))) {
        String? _queriedAddress =
            await WalletRepository.connectToWallet(context);
        if (_queriedAddress != null &&
            _queriedAddress == _walletAddressController.text) {
          setState(() {
            _hasVerifiedWallet = true;
          });
        } else {
          _hasRequested = false;
          CustomDialog.showErrorDialog(
              context, Constants.NO_MATCHING_ADDRESSES);
        }
      } else {
        CustomDialog.showErrorDialog(
            context, Constants.ALGO_ADDRESS_ALREADY_EXISTS);
      }
    }
  }

  void _onPressedFindMatches() {
    //Validates textfields
    if (_formKey.currentState!.validate()) {
      //Checks is user has enabled there location
      if (_hasRequested) {
        //Checks if wallet has been verified
        if (_hasVerifiedWallet) {
          //Stores the images(Non-null images)
          List<File> _images = [];
          //Creates a temporary list of the images(Null+Non-null images)
          List<File?> _imageList = [
            _mainImage,
            _secondaryImage,
            _thirdImage,
            _fourthImage,
            _fifthImage,
            _sixthImage
          ];
          //The number of images entered by the user
          int _imageCount = 0;
          //Loops through the images checking if each image is not null
          for (File? image in _imageList) {
            if (image != null) {
              _imageCount++;
              _images.add(image);
            }
          }
          //Checks if atleast two images have been added
          if (_imageCount >= 2) {
            //TODO:Check if user has stacked trust on backend
            //If true, add user to database and navigate to home screen
            //If false, navigate to matching pledge
            final _user = widget.user.copyWith(
                documentSnapshot: null,
                algoWalletAddress: _walletAddressController.text,
                aboutMe: _aboutMeController.text,
                lifeStyle: _lifeStyleController.text,
                job: _jobTitleController.text,
                isWalletVerified: _hasVerifiedWallet,
                companyName: _companyNameController.text,
                location: GeoPoint(
                    _currentLocation!.latitude, _currentLocation!.longitude),
                gender: _gender,
                sexualOrientation: _sexualOrientation,
                genderPreference: _genderPreference,
                sexualityPreference: _sexualOrientationPreference,
                lowerAgePreference: _lowerAgePreference,
                upperAgePreference: _upperAgePreference,
                radiusDistance: _radiusDistance,
                isRadiusDistanceSelected: false);

            _signUpBloc.add(
                AuthEvent.signUpButtonPressed(_user, _images, widget.password));
          } else {
            CustomDialog.showBasicDialog(
                context,
                Constants.ATLEAST_TWO_IMAGES_REQUIRED,
                Constants.PLEASE_ADD_ATLEAST_TWO_IMAGES,
                '/needs-two-images');
          }
        } else {
          CustomDialog.showBasicDialog(context, Constants.WALLET_NOT_VERIFIED,
              Constants.PLEASE_VERIFY_YOUR_WALLET, '/wallet-not-verified');
        }
      } else {
        CustomDialog.showBasicDialog(context, Constants.LOCATION_NOT_ENABLED,
            Constants.PLEASE_ENABLE_YOUR_LOCATION, '/location-not-enabled');
      }
    }
  }

  @override
  void initState() {
    //Sets default location
    _currentLocation = Location(48.8566, 2.3522);
    //Creates an controller which emits the Google map image at the above location(_currentLocation)
    _controller = StaticMapController(
      googleApiKey: FlutterConfig.get('GOOGLE_MAPS_API_KEY'),
      width: 400,
      height: 400,
      zoom: 10,
      center: _currentLocation,
    );
    super.initState();
  }

  @override
  void dispose() {
    _signUpBloc.close();
    super.dispose();
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
            key: Key(Keys.createAccountDetailsBackButton),
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
      body: BlocListener<AuthBloc, AuthState>(
        bloc: _signUpBloc,
        listener: (context, state) {
          state.maybeWhen(
              loading: () =>
                  OverlayLoader.showLoadingDialog(context, _loadingKey),
              failed: (exception) {
                OverlayLoader.pop(_loadingKey);
                ExceptionHandler.showErrorDialog(context, exception);
              },
              authenticatedAuthentication: () {
                OverlayLoader.pop(_loadingKey);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MatchPledging()),
                    (route) => false);
              },
              orElse: () {});
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveWidget.size(context, 0.0, _size.width * 0.25)),
              child: Column(
                children: [
                  //Create account text
                  GradientText(
                    Constants.CREATE_AN_ACCOUNT,
                    gradient: LinearGradient(
                        colors: [Constants.sky_blue, Constants.pink]),
                    style: TextStyle(
                        fontSize: ResponsiveWidget.size(
                            context, _size.width * 0.1, _size.width * 0.04)),
                  ),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  //Add photos text
                  Padding(
                    padding: EdgeInsets.only(left: _size.width * 0.02),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(ResponsiveWidget.size(
                                context,
                                _size.width * 0.01,
                                _size.width * 0.005)),
                            child: Text(Constants.ADD_PHOTOS,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveWidget.size(
                                        context,
                                        _size.width * 0.05,
                                        _size.width * 0.025),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(ResponsiveWidget.size(
                                context,
                                _size.width * 0.01,
                                _size.width * 0.005)),
                            child: Text(Constants.MINIMUM_TWO_PHOTOS,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: ResponsiveWidget.size(
                                        context,
                                        _size.width * 0.04,
                                        _size.width * 0.02))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Photos
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 11 / 16,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      PhotoCard(
                          key: Key('create-account-details-first-photo-card'),
                          image: _mainImage,
                          onPressed: () {
                            _selectImageFromGallery(FNum.FIRST);
                          }),
                      PhotoCard(
                          key: Key('create-account-details-second-photo-card'),
                          image: _secondaryImage,
                          onPressed: () {
                            _selectImageFromGallery(FNum.SECOND);
                          }),
                      PhotoCard(
                          image: _thirdImage,
                          onPressed: () {
                            _selectImageFromGallery(FNum.THIRD);
                          }),
                      PhotoCard(
                          image: _fourthImage,
                          onPressed: () {
                            _selectImageFromGallery(FNum.FOURTH);
                          }),
                      PhotoCard(
                          image: _fifthImage,
                          onPressed: () {
                            _selectImageFromGallery(FNum.FIFTH);
                          }),
                      PhotoCard(
                          image: _sixthImage,
                          onPressed: () {
                            _selectImageFromGallery(FNum.SIXTH);
                          }),
                    ],
                  ),
                  SizedBox(
                    height: _size.height * 0.01,
                  ),
                  //Algorand wallet address
                  CustomTextField(
                      textFieldKey:
                          Key(Fields.createAccountDetailsWalletAddress.key),
                      title: Constants.ALGORAND_WALLET_ADDRESS,
                      hintText: Constants.ALGORAND_WALLET_ADDRESS,
                      maxLines: 1,
                      validator: walletValidator,
                      formatter: walletFormatters(),
                      controller: _walletAddressController,
                      horizontalPadding: ResponsiveWidget.size(
                          context, _size.width * 0.01, 0.0)),
                  //Verify button
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: GlowButton(
                            key: Key('create-account-details-verify-button'),
                            text: _hasVerifiedWallet
                                ? Constants.VERIFIED
                                : Constants.VERIFY,
                            buttonWidth: _size.width,
                            buttonHeight: _size.height * 0.07,
                            onPress: () {
                              // _verifyAddress(context);
                            },
                            horizontalPadding: ResponsiveWidget.size(context,
                                _size.width * 0.03, _size.width * 0.01)),
                      ),
                      Expanded(
                        flex: 1,
                        child: _hasVerifiedWallet
                            ? Icon(
                                Icons.check_circle_rounded,
                                color: Colors.green,
                                size: w(context, 30),
                              )
                            : Icon(
                                Icons.remove_circle_outline_rounded,
                                color: Colors.grey[500],
                                size: w(context, 30),
                              ),
                      )
                    ],
                  ),
                  //About me
                  CustomTextField(
                    textFieldKey: Key(Fields.createAccountDetailsAboutMe.key),
                    title: Constants.ABOUT_ME,
                    hintText: Constants.ABOUT_ME_MESSAGE,
                    maxLines: 8,
                    validator: (String? text) =>
                        longTextValidator(text, Constants.ABOUT_YOURSELF),
                    formatter: longTextFormatter(),
                    controller: _aboutMeController,
                    horizontalPadding:
                        ResponsiveWidget.size(context, _size.width * 0.01, 0.0),
                  ),
                  //Life Style
                  CustomTextField(
                    textFieldKey: Key(Fields.createAccountDetailsLifeStyle.key),
                    title: Constants.LIFE_STYLE,
                    hintText: Constants.LIFE_STYLE_MESSAGE,
                    maxLines: 8,
                    validator: (String? text) =>
                        longTextValidator(text, Constants.ABOUT_YOUR_LIFESTYLE),
                    formatter: longTextFormatter(),
                    controller: _lifeStyleController,
                    horizontalPadding:
                        ResponsiveWidget.size(context, _size.width * 0.01, 0.0),
                  ),
                  //Job title
                  CustomTextField(
                    textFieldKey: Key(Fields.createAccountDetailsJobTitle.key),
                    title: Constants.JOB,
                    hintText: Constants.JOB_TITLE,
                    maxLines: 1,
                    validator: (String? val) =>
                        shortTextValidator(val, Constants.JOB_TITLE),
                    formatter: shortTextFormatter(),
                    controller: _jobTitleController,
                    horizontalPadding:
                        ResponsiveWidget.size(context, _size.width * 0.01, 0.0),
                  ),
                  //Company name
                  CustomTextField(
                    textFieldKey: Key(Fields.createAccountDetailsCompany.key),
                    title: Constants.COMPANY,
                    hintText: Constants.COMPANY_NAME,
                    maxLines: 1,
                    validator: (String? val) =>
                        shortTextValidator(val, Constants.COMPANY_NAME),
                    formatter: shortTextFormatter(),
                    controller: _companyNameController,
                    horizontalPadding:
                        ResponsiveWidget.size(context, _size.width * 0.01, 0.0),
                  ),
                  //My location
                  //todo: Add following to info.plist
                  //<key>NSLocationWhenInUseUsageDescription</key>
                  // <string>This app needs access to location when open.</string>
                  // <key>NSLocationAlwaysUsageDescription</key>
                  // <string>This app needs access to location when in the background.</string>
                  //Add this too if necessary:
                  //<key>NSLocationTemporaryUsageDescriptionDictionary</key>
                  // <dict>
                  //   <key>YourPurposeKey</key>
                  //   <string>The example App requires temporary access to the device&apos;s precise location.</string>
                  // </dict>
                  Padding(
                    padding: EdgeInsets.all(_size.width * 0.01),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(_size.width * 0.02),
                            child: Text(Constants.MY_LOCATION,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveWidget.size(context,
                                        _size.width * 0.05, _size.width * 0.03),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(ResponsiveWidget.size(context,
                              _size.width * 0.02, _size.width * 0.005)),
                          child: Container(
                            height: ResponsiveWidget.size(
                                context, _size.width * 0.6, _size.width * 0.3),
                            width: ResponsiveWidget.size(
                                context, _size.width * 0.6, _size.width * 0.3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image:
                                    DecorationImage(image: _controller!.image)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _size.width * 0.06,
                                vertical: _size.width * 0.02),
                            child: Text(Constants.ENABLE_LOCATION_TO_USE_TRUYOU,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: ResponsiveWidget.size(context,
                                      _size.width * 0.05, _size.width * 0.03),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: _size.height * 0.02,
                        ),
                        OutlinedGlowButton(
                          key: Key(
                              'create-account-details-allow-location-permission-button'),
                          widget: Text(
                            Constants.ENABLE_LOCATION,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveWidget.size(context,
                                  _size.width * 0.05, _size.width * 0.03),
                            ),
                          ),
                          buttonWidth: _size.width,
                          buttonHeight: _size.height * 0.07,
                          onPress: () {
                            //Enable location permission
                            debugPrint('Location button pressed');
                            _allowLocationPermission();
                          },
                        ),
                        CustomDropDown(
                            defaultValue: Constants.genders[0],
                            title: Constants.I_AM_A,
                            hintText: Constants.GENDER,
                            onValueChanged: (String? val) {
                              setState(() {
                                _gender = val;
                              });
                            },
                            items: Constants.genders),
                        CustomDropDown(
                            defaultValue: Constants.genders[0],
                            title: Constants.I_AM_LOOKING_FOR,
                            hintText: Constants.GENDER,
                            onValueChanged: (String? val) {
                              setState(() {
                                _genderPreference = val;
                              });
                            },
                            items: Constants.genders),
                        CustomDropDown(
                            defaultValue: Constants.sexual_orientation[0],
                            title: Constants.MY_SEXUAL_ORIENTATION_IS,
                            hintText: Constants.SEXUAL_ORIENTATION,
                            onValueChanged: (String? val) {
                              setState(() {
                                _sexualOrientation = val;
                              });
                            },
                            items: Constants.sexual_orientation),
                        CustomDropDown(
                            defaultValue: Constants.sexual_orientation[0],
                            title: Constants.I_PREFER,
                            hintText: Constants.SEXUAL_ORIENTATION,
                            onValueChanged: (String? val) {
                              setState(() {
                                _sexualOrientationPreference = val;
                              });
                            },
                            items: Constants.sexual_orientation),
                      ],
                    ),
                  ),
                  GlowButton(
                      key: Key(Keys.createAccountDetailsFindMatchesButton),
                      text: Constants.FIND_MATCHES,
                      buttonWidth: _size.width,
                      buttonHeight: _size.height * 0.07,
                      onPress: () {
                        _onPressedFindMatches();
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
