import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/back_button.dart';

class TokenGiftScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String receipient;
  TokenGiftScreen(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.receipient})
      : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _algoBalance = 52.3;
  TextEditingController _algorandController = TextEditingController();

  void _onPressedSendTokens(BuildContext context) {
    //TODO: Validate textfield
    if (_formKey.currentState!.validate()) {
      CustomDialog.showGiftConfirmationDialog(context, receipient, title);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.background_color,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: CustomBackButton(),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: _size.width * 0.06),
        ),
      ),
      body: Form(
        key: _formKey,
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
                padding: EdgeInsets.all(p(context, 8.0)),
                child: CustomTextField(
                    textFieldKey: Key('token-gift-textfield'),
                    title: title,
                    hintText: title,
                    maxLines: 1,
                    validator: (e) {},
                    formatter: [],
                    controller: _algorandController)),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 0.0, horizontal: p(context, 25.0)),
                child: Text(
                  '1 ALGO = 23.2343 $title',
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
              _onPressedSendTokens(context);
            })
      ],
    );
  }
}
