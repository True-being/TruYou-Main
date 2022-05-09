import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:truyou/components/utils/validators/trust_validator.dart';
import 'package:truyou/components/widgets/pledge_card.dart';
import 'package:truyou/screens/app_root.dart';

import '../../components/components.dart';

class MatchPledging extends StatelessWidget {
  //TODO: Add route
  MatchPledging({Key? key}) : super(key: key);

  //Builds 3 cards
  List<PledgeCard> _buildCards(BuildContext context) {
    return [
      PledgeCard(
          key: Key('pledge-card-pledge-trust'),
          color: Constants.blue_violet,
          child: _pledgeTrust(context)),
      PledgeCard(
          key: Key('pledge-card-stake-trust'),
          color: Constants.sky_blue,
          child: _stakeTrust(context)),
      PledgeCard(color: Constants.pink, child: _goSocial(context))
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.background_color,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Constants.background_color,
          leading: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(ResponsiveWidget.size(
                  context, _size.width * 0.02, _size.width * 0.005)),
              child: IconButton(
                //TODO: Change functionality
                //TODO: Check if user has staked before they can click cross
                key: Key('back-to-find-matches-screen'),
                icon: Icon(
                  CupertinoIcons.clear,
                  size: ResponsiveWidget.size(
                      context, _size.width * 0.055, _size.width * 0.03),
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushAndRemoveUntil(AppRoot.route(), (route) => false);
                },
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Match pledging text
              GradientText(
                Constants.MATCH_PLEDGING,
                gradient: LinearGradient(
                    colors: [Constants.sky_blue, Constants.pink]),
                style: TextStyle(
                    fontSize: ResponsiveWidget.size(
                        context, _size.width * 0.1, _size.width * 0.04)),
              ),
              SizedBox(height: _size.height * 0.04),
              //Match pledging notice
              Padding(
                padding: EdgeInsets.all(_size.width * 0.04),
                child: Text(
                  Constants.MATCH_PLEDGING_MESSAGE,
                  style: TextStyle(
                      color: Colors.white54, fontSize: _size.width * 0.04),
                  textAlign: TextAlign.center,
                ),
              ),
              //Card carousel
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _size.width * 0.04,
                    vertical: _size.width * 0.02),
                child: Container(
                  width: _size.width,
                  height: _size.height * 0.6,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return _buildCards(context)[index];
                    },
                    itemCount: 3,
                    pagination: SwiperPagination(margin: EdgeInsets.all(0)),
                    control: SwiperControl(color: Colors.transparent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final TextEditingController _matchPledgingController =
    TextEditingController(text: '01');

GlobalKey<FormState> _matchPledgingFormKey = GlobalKey<FormState>();

//Pledge Trust Card UI
Widget _pledgeTrust(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return Form(
    key: _matchPledgingFormKey,
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.all(size.width * 0.01),
            child: Text(
              Constants.PLEDGE_TRUST,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Text(Constants.PLEDGE_TRUST_MESSAGE,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(height: size.height * 0.01),
          Text(Constants.AMOUNT_OF_TRUST,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w400)),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.width * 0.01, horizontal: size.width * 0.04),
            child: TextFormField(
              key: Key(Fields.matchPledgingPledgeTrustField.key),
              keyboardType: TextInputType.number,
              controller: _matchPledgingController,
              textAlign: TextAlign.center,
              inputFormatters: matchPledgingFormatter(),
              validator: trustValidator,
              onFieldSubmitted: (String value) {
                _matchPledgingController.text = value;
              },
              style: TextStyle(
                  color: Constants.background_color,
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(Constants.PLEDGE_RATIO,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w400)),
          SizedBox(height: size.height * 0.01),
          GestureDetector(
            key: Key(Keys.matchPledgingPledgeTrustButton),
            onTap: () {
              if (_matchPledgingFormKey.currentState!.validate()) {
                //todo: PLEDGE TRUST
              }
            },
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xff6C45B8)),
              child: Center(
                  child: Text(Constants.PLEDGE_TRUST,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600))),
            ),
          )
        ],
      ),
    ),
  );
}

final TextEditingController _stakeTrustController = TextEditingController();
GlobalKey<FormState> _stakeTrustFormKey = GlobalKey<FormState>();

//Stake trust card UI
Widget _stakeTrust(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Form(
    key: _stakeTrustFormKey,
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.015),
          Padding(
            padding: EdgeInsets.all(size.width * 0.01),
            child: Text(
              Constants.MATCH_STAKING,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Text(Constants.MATCH_STAKING_MESSAGE,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(height: size.height * 0.01),
          Text(Constants.TOTAL_VOLUME_OF_TRUST,
              style: TextStyle(
                  color: Constants.background_color,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600)),
          //TODO: ADD LIVE LOCKED VOLUME
          Text('14 500 000',
              style: TextStyle(
                  color: Constants.background_color,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: size.height * 0.01),
          //todo: ADD LIVE VALUE TO APR
          Text(Constants.CURRENT_TRUST_APR + '34%',
              style: TextStyle(
                  color: Constants.background_color,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.width * 0.01, horizontal: size.width * 0.04),
            child: TextFormField(
              key: Key('stake-trust-textfield'),
              keyboardType: TextInputType.number,
              controller: _stakeTrustController,
              textAlign: TextAlign.center,
              inputFormatters: stakeTrustFormatter(),
              validator: trustValidator,
              onFieldSubmitted: (String value) {
                _stakeTrustController.text = value;
              },
              style: TextStyle(
                  color: Constants.background_color,
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          GestureDetector(
            key: Key('stake-trust-button'),
            onTap: () {
              if (_stakeTrustFormKey.currentState!.validate()) {
                //TODO: Stake trust
              }
            },
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xff51B2CE)),
              child: Center(
                  child: Text(Constants.STAKE_TRUST,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600))),
            ),
          )
        ],
      ),
    ),
  );
}

//Go social card UI
Widget _goSocial(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: size.height * 0.01),
        Padding(
          padding: EdgeInsets.all(size.width * 0.03),
          child: Text(Constants.GO_SOCIAL_MESSAGE,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w400)),
        ),
        SizedBox(height: size.height * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.width * 0.01, horizontal: size.width * 0.03),
          child: Text(Constants.GO_SOCIAL_ACCESS_TO,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w400)),
        ),
        SizedBox(height: size.height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.width * 0.01, horizontal: size.width * 0.03),
          child: GradientText(Constants.THE_CONVERSATION,
              style: TextStyle(
                  fontSize: size.width * 0.06, fontWeight: FontWeight.w600),
              gradient: LinearGradient(
                  colors: [Constants.sky_blue, Constants.blue_jeans])),
        ),
        SizedBox(height: size.height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.width * 0.01, horizontal: size.width * 0.05),
          child: Text(Constants.GO_SOCIAL_BIG_OPEN_MESSENGER,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w400)),
        ),
        SizedBox(height: size.height * 0.05),
        GestureDetector(
          key: Key(Keys.matchPledgingGoSocialButton),
          onTap: () {
            //TODO: Only allow user to Go social room
            //TODO: Lock all drawer items
            Navigator.of(context)
                .pushAndRemoveUntil(AppRoot.route(), (route) => false);
          },
          child: Container(
            width: size.width * 0.6,
            height: size.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0xffB734B8)),
            child: Center(
                child: Text(Constants.GO_SOCIAL,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w600))),
          ),
        )
      ],
    ),
  );
}
