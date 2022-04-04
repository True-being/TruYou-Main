import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:truyou/components/components.dart';
import 'package:location/location.dart' as location;
import 'package:truyou/models/auth_user_model.dart';
import 'package:truyou/screens/home_screen.dart';
import 'package:truyou/services/image_picker_service.dart';

//File number - Used to identify the file being changed
enum FNum { FIRST, SECOND, THIRD, FOURTH, FIFTH, SIXTH }

class CreateAccountDetailsScreen extends StatefulWidget {
  final AuthUser user;

  static Route route(AuthUser authUser) {
    return MaterialPageRoute(
      builder: (_) => CreateAccountDetailsScreen(user: authUser),
      settings: const RouteSettings(name: '/create-account-details-screen'),
    );
  }

  const CreateAccountDetailsScreen({Key? key, required this.user})
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

  //Gender of user
  String? _gender = Constants.genders[0];
  //Sexual Orientation of user
  String? _sexual_orientation = Constants.sexual_orientation[0];

  //Form key - Validation
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Prevents constant spam of request permission
  bool _onRequest = false;

  //Checks if user has granted the permission for location
  bool _hasRequested = false;

  //Checks if wallet has been verified - Checks if wallet exists in the Database
  bool _hasVerifiedWallet = false;

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

  void _onPressedFindMatches() {
    //Validates textfields
    if (_formKey.currentState!.validate()) {
      //Checks is user has enabled there location
      if (_hasRequested) {
        //Checks if wallet has been verified
        if (_hasVerifiedWallet) {
          //Stores the images(Non-null images)
          List<File?> _images = [];
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
            //TODO:Give the AuthUser model equality(Freezed or Equatable)
            // AuthUser _user = widget.user.copyWith(
            //     photos: _images,
            //     algoWalletAddress: _walletAddressController.text,
            //     aboutMe: _aboutMeController.text,
            //     lifeStyle: _lifeStyleController.text,
            //     job: _jobTitleController.text,
            //     companyName: _companyNameController.text,
            //     location: LatLng(
            //         _currentLocation.latitude, _currentLocation.longitude),
            //     gender: _gender,
            //     sexualOrientation: _sexual_orientation);
            //TODO:Add user to database
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
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
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Constants.background_color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            key: Key('create-account-details-back-button'),
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
                          padding: EdgeInsets.all(ResponsiveWidget.size(context,
                              _size.width * 0.01, _size.width * 0.005)),
                          child: Text(Constants.ADD_PHOTOS,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ResponsiveWidget.size(context,
                                      _size.width * 0.05, _size.width * 0.025),
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(ResponsiveWidget.size(context,
                              _size.width * 0.01, _size.width * 0.005)),
                          child: Text(Constants.MINIMUM_TWO_PHOTOS,
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: ResponsiveWidget.size(context,
                                      _size.width * 0.04, _size.width * 0.02))),
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
                    textFieldKey: Key('create-account-details-wallet-address'),
                    title: Constants.ALGORAND_WALLET_ADDRESS,
                    hintText: Constants.ALGORAND_WALLET_ADDRESS,
                    maxLines: 1,
                    validator: walletValidator,
                    formatter: walletFormatters(),
                    controller: _walletAddressController,
                    horizontalPadding: ResponsiveWidget.size(
                        context, _size.width * 0.01, 0.0)),
                //Verify button
                GlowButton(
                    key: Key('create-account-details-verify-button'),
                    text: Constants.VERIFY,
                    buttonWidth: _size.width,
                    buttonHeight: _size.height * 0.07,
                    onPress: () {
                      //TODO: Verify wallet in database
                      setState(() {
                        _hasVerifiedWallet = true;
                      });
                    },
                    horizontalPadding: ResponsiveWidget.size(
                        context, _size.width * 0.03, _size.width * 0.01)),
                //About me
                CustomTextField(
                  textFieldKey: Key('create-account-details-about-me-field'),
                  title: Constants.ABOUT_ME,
                  hintText: Constants.ABOUT_ME_MESSAGE,
                  maxLines: 8,
                  validator: (String? text) =>
                      longTextValidator(text, 'about yourself'),
                  formatter: longTextFormatter(),
                  controller: _aboutMeController,
                  horizontalPadding:
                      ResponsiveWidget.size(context, _size.width * 0.01, 0.0),
                ),
                //Life Style
                CustomTextField(
                  textFieldKey: Key('create-account-details-life-style-field'),
                  title: Constants.LIFE_STYLE,
                  hintText: Constants.LIFE_STYLE_MESSAGE,
                  maxLines: 8,
                  validator: (String? text) =>
                      longTextValidator(text, 'about your lifestyle'),
                  formatter: longTextFormatter(),
                  controller: _lifeStyleController,
                  horizontalPadding:
                      ResponsiveWidget.size(context, _size.width * 0.01, 0.0),
                ),
                //Job title
                CustomTextField(
                  textFieldKey: Key('create-account-details-job-title-field'),
                  title: Constants.JOB,
                  hintText: Constants.JOB_TITLE,
                  maxLines: 1,
                  validator: (String? val) =>
                      shortTextValidator(val, 'job title'),
                  formatter: shortTextFormatter(),
                  controller: _jobTitleController,
                  horizontalPadding:
                      ResponsiveWidget.size(context, _size.width * 0.01, 0.0),
                ),
                //Company name
                CustomTextField(
                  textFieldKey:
                      Key('create-account-details-company-name-field'),
                  title: Constants.COMPANY,
                  hintText: Constants.COMPANY_NAME,
                  maxLines: 1,
                  validator: (String? val) =>
                      shortTextValidator(val, 'company name'),
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
                        padding: EdgeInsets.all(ResponsiveWidget.size(
                            context, _size.width * 0.02, _size.width * 0.005)),
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
                          defaultValue: Constants.sexual_orientation[0],
                          title: Constants.MY_SEXUAL_ORIENTATION_IS,
                          hintText: Constants.SEXUAL_ORIENTATION,
                          onValueChanged: (String? val) {
                            setState(() {
                              _sexual_orientation = val;
                            });
                          },
                          items: Constants.sexual_orientation),
                    ],
                  ),
                ),
                GlowButton(
                    key: Key('create-account-details-find-matches'),
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
    ));
  }
}
