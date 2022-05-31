import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/drawer_item.dart';

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
        backgroundColor: Constants.dark_blue,
        body: Container(
          height: _size.height,
          width: _size.width,
          color: Constants.dark_blue,
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
                      key: Key(Keys.drawerCloseButton),
                      onPressed: () {
                        controller.close();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
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
                      key: Key(Keys.drawerMyProfileButton),
                      title: Constants.MY_PROFILE,
                      icon: Icon(CupertinoIcons.profile_circled),
                      onPressed: () {
                        controller.setSelectedMenuPosition(1);
                      }),
                  DrawerItem(
                      key: Key(Keys.drawerMyMatchesButton),
                      title: Constants.MY_MATCHES,
                      icon: Icon(CupertinoIcons.person_2_fill),
                      onPressed: () {
                        controller.setSelectedMenuPosition(2);
                      }),
                  DrawerItem(
                      key: Key(Keys.drawerGoSocialButton),
                      title: Constants.GO_SOCIAL,
                      icon: Icon(CupertinoIcons.link),
                      onPressed: () {
                        controller.setSelectedMenuPosition(3);
                      }),
                  DrawerItem(
                      key: Key(Keys.drawerPremiumFeaturesButton),
                      title: Constants.PREMIUM_FEATURES,
                      icon: Icon(CupertinoIcons.graph_circle_fill),
                      onPressed: () {
                        controller.setSelectedMenuPosition(4);
                      }),
                  DrawerItem(
                      key: Key(Keys.drawerPartnershipsButton),
                      title: Constants.PARTNERSHIPS,
                      icon: Icon(Icons.handshake_rounded),
                      onPressed: () {
                        controller.setSelectedMenuPosition(5);
                      }),
                  DrawerItem(
                      key: Key(Keys.drawerSettingsButton),
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
