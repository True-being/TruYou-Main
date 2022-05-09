import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/notification_card.dart';

///Notifications tab
class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
        color: Constants.background_color,
        width: _size.width,
        height: _size.height,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return NotificationCard();
            }));
  }
}
