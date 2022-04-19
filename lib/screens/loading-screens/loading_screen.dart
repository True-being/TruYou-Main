import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/screens/sign-in-options/welcome_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Delays push to home scren by 4 seconds
  Future<void> delayedTransition() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        (route) => false);
  }

  //Sets the orientation to portrait only for Phones
  //Sets the orientation to landscape only for Tablets/iPads
  void setDeviceOrientation() {
    var deviceData = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    if (deviceData.size.shortestSide < 600) {
      //Phone orientation
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      //Tablet/iPad orientation
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
    delayedTransition();
  }

  @override
  void initState() {
    super.initState();
    setDeviceOrientation();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.background_color,
      body: Center(
        child: Logo(
            width: ResponsiveWidget.size(
                context, _size.width * 0.7, _size.height * 0.4),
            height: ResponsiveWidget.size(
                context, _size.height * 0.7, _size.height * 0.4)),
      ),
    );
  }
}
