import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/drawer_item.dart';
import 'package:truyou/screens/find-matches/find_matches.dart';
import 'package:truyou/screens/my-matches/my_matches.dart';
import 'package:truyou/screens/profile/my_profile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late SimpleHiddenDrawerController controller;

  @override
  void didChangeDependencies() {
    controller = SimpleHiddenDrawerController.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.blue_violet,
        body: Container(
          height: _size.height,
          width: _size.width,
          color: Constants.blue_violet,
          child: Padding(
            padding: EdgeInsets.only(left: _size.width * 0.02),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: _size.height * 0.15,
                  ),
                  IconButton(
                      onPressed: () {
                        controller.close();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Constants.background_color,
                        size: _size.width * 0.07,
                      )),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  DrawerItem(
                      title: Constants.FIND_MATCHES,
                      icon: Icon(CupertinoIcons.search),
                      onPressed: () {
                        controller.setSelectedMenuPosition(0);
                      }),
                  DrawerItem(
                      title: Constants.MY_PROFILE,
                      icon: Icon(CupertinoIcons.profile_circled),
                      onPressed: () {
                        controller.setSelectedMenuPosition(1);
                      }),
                  DrawerItem(
                      title: Constants.MY_MATCHES,
                      icon: Icon(CupertinoIcons.person_2_fill),
                      onPressed: () {
                        controller.setSelectedMenuPosition(2);
                      }),
                  DrawerItem(
                      title: Constants.GO_SOCIAL,
                      icon: Icon(CupertinoIcons.link),
                      onPressed: () {
                        controller.setSelectedMenuPosition(3);
                      }),
                  DrawerItem(
                      title: Constants.PREMIUM_FEATURES,
                      icon: Icon(CupertinoIcons.graph_circle_fill),
                      onPressed: () {
                        controller.setSelectedMenuPosition(4);
                      }),
                  DrawerItem(
                      title: Constants.PARTNERSHIPS,
                      icon: Icon(Icons.handshake_rounded),
                      onPressed: () {
                        controller.setSelectedMenuPosition(5);
                      }),
                  DrawerItem(
                      title: Constants.SETTINGS,
                      icon: Icon(CupertinoIcons.settings),
                      onPressed: () {
                        controller.setSelectedMenuPosition(6);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
