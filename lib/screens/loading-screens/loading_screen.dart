import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:truyou/bloc/auth_bloc/auth_bloc.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/screens/app_root.dart';
import 'package:truyou/screens/sign-in-options/welcome_screen.dart';
import 'package:truyou/services/provider_service.dart';

class TruYouApp extends StatefulWidget {
  const TruYouApp({Key? key}) : super(key: key);

  @override
  State<TruYouApp> createState() => _TruYouAppState();
}

class _TruYouAppState extends State<TruYouApp> {
  final _authBloc = getit<AuthBloc>();
  final _userProvider = getit<UserProvider>();

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
  }

  @override
  void initState() {
    super.initState();
    setDeviceOrientation();
    _authBloc.add(AuthEvent.appStarted());
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
            initialData: null, value: _userProvider.userController.stream),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TruYou',
        highContrastDarkTheme: ThemeData.dark(),
        theme: buildAppTheme(context),
        home: BlocBuilder<AuthBloc, AuthState>(
          bloc: _authBloc,
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => LoadingScreen(),
                unAuthenticatedAuthentication: () => WelcomeScreen(),
                authenticatedAuthentication: () => AppRoot(),
                orElse: () {
                  return Container();
                });
          },
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
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
