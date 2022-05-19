import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/custom_app_bar.dart';

///Screen to display details about the NFT selected
class NFTGiftScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String receipient;
  NFTGiftScreen(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.receipient})
      : super(key: key);

  double _algoBalance = 52.3;

  void _onPressedSendNFTs(BuildContext context) {
    CustomDialog.showGiftConfirmationDialog(context, receipient, title);
  }

  double price = 28.23;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.background_color,
      appBar: customAppBar(context, Keys.nftGiftBackButton, title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SpacerV.m(context),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: w(context, 128),
                height: w(context, 128),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(imagePath))),
              ),
            ),
            SpacerV.m(context),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: p(context, 8.0), horizontal: p(context, 20.0)),
                child: Text(
                  Constants.YOUR_BALANCE,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: f(context, 25),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: p(context, 8.0), horizontal: p(context, 20.0)),
                child: Text(
                  '$_algoBalance ' + Constants.ALGO,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: f(context, 20),
                  ),
                ),
              ),
            ),
            SpacerV.s(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: p(context, 16.0)),
              child: Container(
                width: _size.width,
                height: h(context, 20),
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(15.0)),
                padding: EdgeInsets.symmetric(
                    horizontal: p(context, 16.0), vertical: p(context, 8.0)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'x1 ' + title,
                    style: TextStyle(
                        color: Colors.grey[100], fontSize: f(context, 19.0)),
                  ),
                ),
              ),
            ),
            SpacerV.s(context),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 0.0, horizontal: p(context, 25.0)),
                child: Text(
                  '= $price ${Constants.ALGO}',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: f(context, 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        GlowButton(
            key: Key('send-token-gift-button'),
            text: Constants.SEND + ' ' + title,
            buttonWidth: _size.width,
            buttonHeight: _size.height * 0.07,
            onPress: () {
              _onPressedSendNFTs(context);
            })
      ],
    );
  }
}
