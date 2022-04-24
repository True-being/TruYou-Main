import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

class ItsAMatchScreen extends StatefulWidget {
  const ItsAMatchScreen({Key? key}) : super(key: key);

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
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: _size.width * 0.07,
                ),
              ),
            ),
            GradientText(
              Constants.ITS_A_MATCH,
              gradient:
                  LinearGradient(colors: [Constants.sky_blue, Constants.pink]),
              style: TextStyle(fontSize: _size.width * 0.08),
            ),
            SizedBox(
              height: _size.height * 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(_size.width * 0.02),
                  child: Stack(children: [
                    Image.asset(
                      'assets/hologram.png',
                      width: _size.width * 0.4,
                      height: _size.width * 0.4,
                    ),
                    Image.asset(
                      'assets/holo_women.png',
                      width: _size.width * 0.4,
                      height: _size.width * 0.4,
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.all(_size.width * 0.02),
                  child: Stack(children: [
                    Image.asset(
                      'assets/hologram.png',
                      width: _size.width * 0.4,
                      height: _size.width * 0.4,
                    ),
                    Image.asset(
                      'assets/holo_women.png',
                      width: _size.width * 0.4,
                      height: _size.width * 0.4,
                    ),
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: _size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.all(_size.width * 0.03),
              child: Text(
                Constants.ITS_A_MATCH_MESSAGE,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Constants.sky_blue,
                  fontSize: _size.width * 0.045,
                ),
              ),
            ),
            SizedBox(
              height: _size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedGlowButton(
                    widget: Text(
                      Constants.NEVERMIND,
                      style: TextStyle(
                          color: Colors.white, fontSize: _size.width * 0.045),
                    ),
                    buttonWidth: _size.width * 0.4,
                    buttonHeight: _size.height * 0.07,
                    onPress: () {
                      //TODO: Cancel match
                      Navigator.of(context).pop();
                    }),
                OutlinedGlowButton(
                    widget: Text(Constants.SEND_AN_INVITE,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: _size.width * 0.045)),
                    buttonWidth: _size.width * 0.4,
                    buttonHeight: _size.height * 0.07,
                    onPress: () {
                      //TODO: Display dialog for trust invite
                      CustomDialog.showMatchInviteDialog(context);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
