import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:location/location.dart' as location;
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/custom_app_bar.dart';
import 'package:truyou/components/widgets/custom_switch.dart';

class LocationSettings extends StatefulWidget {
  const LocationSettings({Key? key}) : super(key: key);

  static MaterialPageRoute route() {
    return MaterialPageRoute(
        builder: (context) => LocationSettings(),
        settings: const RouteSettings(name: Routes.locationSettings));
  }

  @override
  State<LocationSettings> createState() => _LocationSettingsState();
}

class _LocationSettingsState extends State<LocationSettings> {
  Location? _currentLocation;
  //The controller of the static map
  StaticMapController? _controller;
  //Slider value
  double _sliderValue = 1;

  void _allowLocationPermission() async {
    var status = await Permission.location.request();
    //Checks if permission was granted
    if (status.isGranted) {
      location.Location _locationIstance = location.Location();
      //Gets the users current location
      location.LocationData _location = await _locationIstance.getLocation();
      setState(() {
        //Sets the users current location
        _currentLocation = Location(_location.latitude!, _location.longitude!);
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

    _allowLocationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.background_color,
      appBar: customAppBar(context, Keys.locationSettingsBackButton,
          Constants.LOCATION_SETTINGS),
      body: Column(
        children: [
          CDivider(),
          Padding(
            padding: EdgeInsets.all(p(context, 16.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMyLocationTitle(theme),
                SpacerV.c(context, 2.0),
                _buildMyLocationSubTitle(theme, 'Brooklyn, New York'),
                SpacerV.s(context),
                _buildMatchingDistanceButton(context),
                SpacerV.s(context),
                _buildMapImage(context),
                SpacerV.s(context),
              ],
            ),
          ),
          CDivider(),
          Padding(
            padding: EdgeInsets.all(p(context, 16.0)),
            child: _buildMileSlider(theme, context),
          ),
          CDivider(),
          Padding(
            padding: EdgeInsets.all(p(context, 16.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOnlyShowPeopleTitle(theme),
                CSwitch(active: (bool val) {
                  print(val);
                })
              ],
            ),
          ),
          CDivider()
        ],
      ),
    );
  }

  Widget _buildMyLocationTitle(ThemeData theme) {
    return Text(
      Constants.MY_LOCATION,
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }

  Widget _buildMyLocationSubTitle(ThemeData theme, String location) {
    return Row(
      children: [
        Icon(
          Icons.location_pin,
          color: Colors.grey[500],
          size: w(context, 20),
        ),
        SizedBox(width: 5),
        Text(
          location,
          style: theme.textTheme.headline1?.copyWith(
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        )
      ],
    );
  }

  Widget _buildOnlyShowPeopleTitle(ThemeData theme) {
    return Text(
      Constants.ONLY_SHOW_PEOPLE_IN_THIS_RANGE,
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.grey[500],
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    );
  }

  Widget _buildMapImage(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(p(context, 4.0)),
      child: Container(
        width: size.width,
        height: h(context, 75),
        decoration: BoxDecoration(
            image:
                DecorationImage(image: _controller!.image, fit: BoxFit.cover)),
      ),
    );
  }

  Widget _buildDistanceInMilesTitle(ThemeData theme) {
    return Text(
      Constants.MATCHING_DISTANCE,
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.grey[300],
        fontWeight: FontWeight.w500,
        fontSize: 25,
      ),
    );
  }

  Widget _buildMiles(ThemeData theme, double miles) {
    return Text(
      '${miles.round()} mi',
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.grey[500],
        fontWeight: FontWeight.w500,
        fontSize: 19,
      ),
    );
  }

  Widget _buildMileSlider(ThemeData theme, BuildContext context) {
    return StatefulBuilder(builder: (context, setstate) {
      return Column(
        children: [
          //Write all entries to SQFliteJournalEntries//Write all entries to SQFliteJournalEntries
          Padding(
            padding: EdgeInsets.symmetric(horizontal: p(context, 8.0)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDistanceInMilesTitle(theme),
                  _buildMiles(theme, _sliderValue)
                ]),
          ),
          SpacerV.s(context),
          SliderTheme(
            data: SliderThemeData(
                trackHeight: 6,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15)),
            child: Slider(
              min: 1.0,
              max: 1000.0,
              thumbColor: Constants.thumb_color,
              activeColor: Constants.track_color,
              inactiveColor: Constants.track_color,
              value: _sliderValue,
              onChanged: (value) {
                setstate(() {
                  _sliderValue = value;
                });
              },
            ),
          )
        ],
      );
    });
  }

  Widget _buildMatchingDistanceButton(BuildContext context) {
    return GlowButton(
        text: Constants.CHANGE,
        fontSize: f(context, 15),
        buttonWidth: w(context, 90),
        buttonHeight: w(context, 30),
        borderRadius: 2.0,
        gradients: [Constants.pink, Constants.pink],
        centerAlign: false,
        horizontalPadding: p(context, 4.0),
        verticalPadding: p(context, 4.0),
        onPress: () {
          //TODO: Save current distance
        });
  }
}
