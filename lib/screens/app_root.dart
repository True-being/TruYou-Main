import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/custom_drawer.dart';
import 'package:truyou/screens/find-matches/find_matches.dart';
import 'package:truyou/screens/go-social/go_social.dart';
import 'package:truyou/screens/my-matches/my_matches.dart';
import 'package:truyou/screens/partnerships/partnerships.dart';
import 'package:truyou/screens/premium-features/premium_features.dart';
import 'package:truyou/screens/profile/my_profile.dart';
import 'package:truyou/screens/settings/settings.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  static MaterialPageRoute route() {
    return MaterialPageRoute(
        builder: (context) => AppRoot(),
        settings: const RouteSettings(name: '/app-root'));
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SimpleHiddenDrawer(
      menu: CustomDrawer(),
      //Viewport percentage
      slidePercent: 60.0,
      screenSelectedBuilder: (position, controller) {
        Widget screenCurrent;

        switch (position) {
          case 0:
            screenCurrent = FindMatches();
            break;
          case 1:
            screenCurrent = MyProfile();
            break;
          case 2:
            screenCurrent = MyMatches();
            break;
          case 3:
            screenCurrent = GoSocial();
            break;
          case 4:
            screenCurrent = PremiumFeatures();
            break;
          case 5:
            screenCurrent = Partnerships();
            break;
          case 6:
            screenCurrent = Settings();
            break;
          default:
            screenCurrent = Container();
            break;
        }

        return Scaffold(
          backgroundColor: Constants.background_color,
          extendBodyBehindAppBar: position == 1 ? true : false,
          appBar: AppBar(
            backgroundColor:
                position == 1 ? Colors.transparent : Constants.background_color,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  controller.toggle();
                }),
            title: Text(
              titleSwapper(position),
              style:
                  TextStyle(color: Colors.white, fontSize: _size.width * 0.055),
            ),
            centerTitle: true,
            actions: [
              //Displays chat bubble on home screen
              position == 0
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.chat_bubble_fill,
                        color: Colors.white,
                        size: ResponsiveWidget.size(
                            context, _size.width * 0.06, _size.width * 0.03),
                      ))
                  : Container()
            ],
          ),
          //Displays the currrent screen
          body: screenCurrent,
        );
      },
    );
  }
}

//Adds title for relevant screen
String titleSwapper(int position) {
  String title = '';
  switch (position) {
    case 0:
    case 1:
    case 4:
      break;
    case 2:
      title = Constants.MY_MATCHES;
      break;
    case 3:
      title = Constants.GO_SOCIAL;
      break;
    case 5:
      title = Constants.PARTNERSHIPS;
      break;
    case 6:
      title = Constants.SETTINGS;
      break;
    default:
      break;
  }
  return title;
}
