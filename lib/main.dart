import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/screens/loading-screens/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initializers firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Inject Dependencies
  DependencyInjection.init();
  //Loads ENV variables
  //TODO: Load .env var into Swift
  //TODO: Check, on RELEASE, that R8 code shrinker DOES NOT obfuscates the BuildConfig class - THIS HOLDS THE ENV
  await FlutterConfig.loadEnvVariables();
  //Runs app
  runApp(const TruYouApp());
}
