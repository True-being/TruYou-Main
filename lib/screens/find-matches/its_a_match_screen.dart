import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/match_animation.dart';

class ItsAMatchScreen extends StatefulWidget {
  const ItsAMatchScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ItsAMatchScreen(),
      settings: const RouteSettings(name: Routes.itsAMatchScreen),
    );
  }

  @override
  State<ItsAMatchScreen> createState() => _ItsAMatchScreenState();
}

class _ItsAMatchScreenState extends State<ItsAMatchScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.background_color,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Container(),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: _size.width * 0.07,
              ),
            )
          ],
        ),
        body: MatchAnimation(),
      ),
    );
  }
}
