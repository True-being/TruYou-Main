import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:truyou/screens/loading-screens/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Loads ENV variables
  //TODO: Load .env var into Swift
  //TODO: Check, on RELEASE, that R8 code shrinker DOES NOT obfuscates the BuildConfig class - THIS HOLDS THE ENV
  await FlutterConfig.loadEnvVariables();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'TruYou',
    highContrastDarkTheme: ThemeData.dark(),
    home: LoadingScreen(),
  ));
}
