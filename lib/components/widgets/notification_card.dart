import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

///Notification on the notifications tab of Chats
class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        color: Constants.dark_blue,
        width: _size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CircleAvatar(
                          backgroundImage: AssetImage('assets/women1.jpg'),
                          maxRadius: _size.width * 0.07)),
                  Expanded(
                    flex: 4,
                    child: Text(
                      Constants.GIFT_NOTIFICATION,
                      style: TextStyle(
                          color: Colors.white, fontSize: _size.width * 0.04),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedGlowButton(
                  widget: Text('Toss',
                      style: TextStyle(
                          color: Colors.white, fontSize: _size.width * 0.03)),
                  buttonWidth: _size.width * 0.2,
                  buttonHeight: _size.height * 0.04,
                  horizontalPadding: 8.0,
                  onPress: () {},
                ),
                OutlinedGlowButton(
                  widget: Text('Open',
                      style: TextStyle(
                          color: Colors.white, fontSize: _size.width * 0.03)),
                  buttonWidth: _size.width * 0.2,
                  buttonHeight: _size.height * 0.04,
                  horizontalPadding: 8.0,
                  onPress: () {},
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Just now',
                  style: TextStyle(color: Constants.sky_blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
