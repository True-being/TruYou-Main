import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/screens/chats/messages/chats.dart';
import 'package:truyou/screens/chats/messages/notifications.dart';

///Chats tab view with app bar
class ChatsTabView extends StatefulWidget {
  const ChatsTabView({Key? key}) : super(key: key);

  static MaterialPageRoute route() {
    return MaterialPageRoute(
        builder: (context) => ChatsTabView(),
        settings: const RouteSettings(name: Routes.chats));
  }

  @override
  State<ChatsTabView> createState() => _ChatsTabViewState();
}

class _ChatsTabViewState extends State<ChatsTabView> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.background_color,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                backgroundColor: Constants.background_color,
                centerTitle: true,
                title: Text(
                  Constants.CHATS,
                  style: TextStyle(
                      color: Colors.white, fontSize: _size.width * 0.055),
                ),
                leading: IconButton(
                    key: Key(Keys.chatsTabViewBackButton),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                      size: _size.width * 0.07,
                    )),
                pinned: true,
                // floating: true,
                bottom: TabBar(
                  padding: EdgeInsets.all(0.0),
                  indicatorColor: Constants.sky_blue,
                  tabs: [
                    Tab(child: Text(Constants.CHATS)),
                    Tab(child: Text(Constants.NOTIFICATIONS)),
                  ],
                ),
              ),
            ];
          },
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: TabBarView(
              children: <Widget>[
                Chats(),
                Notifications(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
