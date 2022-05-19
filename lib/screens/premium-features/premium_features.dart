import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/validators/trust_validator.dart';
import 'package:truyou/components/widgets/color_chip.dart';

class PremiumFeatures extends StatefulWidget {
  const PremiumFeatures({Key? key}) : super(key: key);

  @override
  State<PremiumFeatures> createState() => _PremiumFeaturesState();
}

class _PremiumFeaturesState extends State<PremiumFeatures> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.background_color,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.all(p(context, 20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatsTitle(theme),
              SpacerV.s(context),
              _buildYourStatsInfo(context, theme),
              SpacerV.c(context, 6.0),
              _buildPlatformStatsTitle(theme),
              SpacerV.s(context),
              _buildPlatformStatsInfo(context, theme),
              SpacerV.c(context, 6.0),
              _buildTokenStatsTitle(theme),
              SpacerV.s(context),
              _buildTokenStatsInfo(context, theme),
              SpacerV.c(context, 6.0),
              _buildStakingLevelTitle(theme),
              SpacerV.s(context),
              _buildStakingLevelInfo(context, theme)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsTitle(ThemeData theme) {
    return Text(
      Constants.YOUR_STATS,
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.white,
        fontSize: 23,
      ),
    );
  }

  Widget _buildYourStatsInfo(BuildContext context, ThemeData theme) {
    var _size = MediaQuery.of(context).size;
    var _blue = Constants.sky_blue;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: p(context, 8.0)),
      child: Container(
        width: _size.width,
        padding: EdgeInsets.symmetric(
            vertical: p(context, 16.0), horizontal: p(context, 16.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Constants.dark_blue,
          boxShadow: [
            BoxShadow(
              color: _blue.withOpacity(0.5),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                _buildInfo(context, theme, _blue, 'Matches', '20'),
                SizedBox(
                  width: w(context, 50),
                ),
                _buildInfo(context, theme, _blue, 'Misses', '12'),
              ],
            ),
            SpacerV.m(context),
            Row(
              children: [
                _buildInfo(context, theme, _blue, 'Trust Staked', '400.0'),
                SizedBox(
                  width: w(context, 50),
                ),
                _buildInfo(context, theme, _blue, 'Trust Pledged', '400.0'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformStatsTitle(ThemeData theme) {
    return Text(
      Constants.PLATFORM_STATS,
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.white,
        fontSize: 23,
      ),
    );
  }

  Widget _buildPlatformStatsInfo(BuildContext context, ThemeData theme) {
    var _size = MediaQuery.of(context).size;
    var _pink = Constants.pink;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: p(context, 8.0)),
      child: Container(
        width: _size.width,
        padding: EdgeInsets.symmetric(
            vertical: p(context, 16.0), horizontal: p(context, 16.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Constants.dark_blue,
          boxShadow: [
            BoxShadow(
              color: _pink.withOpacity(0.5),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfo(context, theme, _pink, 'Total Users', '10,200'),
            SpacerV.m(context),
            Row(
              children: [
                _buildInfo(context, theme, _pink, 'Total Matches', '15,000'),
                SizedBox(
                  width: w(context, 50),
                ),
                _buildInfo(context, theme, _pink, 'Total Misses', '7,500'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTokenStatsTitle(ThemeData theme) {
    return Text(
      Constants.TOKEN_STATS,
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.white,
        fontSize: 23,
      ),
    );
  }

  Widget _buildTokenStatsInfo(BuildContext context, ThemeData theme) {
    var _size = MediaQuery.of(context).size;
    var _purple = Constants.purple;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: p(context, 8.0)),
      child: Container(
        width: _size.width,
        padding: EdgeInsets.symmetric(
            vertical: p(context, 16.0), horizontal: p(context, 16.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Constants.dark_blue,
          boxShadow: [
            BoxShadow(
              color: _purple.withOpacity(0.5),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfo(
                context, theme, _purple, 'Total Trust Pledged', '100,000'),
            SpacerV.m(context),
            _buildInfo(
                context, theme, _purple, 'Total Trust Staked', '100,000'),
            SpacerV.m(context),
            _buildInfo(context, theme, _purple, 'Total Value Locked',
                '100,000,000,000'),
            SpacerV.m(context),
            _buildInfo(context, theme, _purple, 'Total Dividend Accumulation',
                '400,000,000,000'),
            SpacerV.m(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStakingLevelTitle(ThemeData theme) {
    return Text(
      Constants.TOKEN_STATS,
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.white,
        fontSize: 23,
      ),
    );
  }

  Widget _buildStakingLevelInfo(BuildContext context, ThemeData theme) {
    var _size = MediaQuery.of(context).size;
    var _blueV = Constants.blue_violet;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: p(context, 8.0)),
      child: Container(
        width: _size.width,
        padding: EdgeInsets.symmetric(
            vertical: p(context, 16.0), horizontal: p(context, 16.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Constants.dark_blue,
          boxShadow: [
            BoxShadow(
              color: _blueV.withOpacity(0.5),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStakingInfo(context, theme, _blueV, 'Your Staking Level',
                _buildLevel(theme)),
            SpacerV.m(context),
            _buildStakingInfo(context, theme, _blueV, 'Your Pledging Discount',
                _buildDiscount(theme)),
            SpacerV.m(context),
            _buildStakingInfo(
                context, theme, _blueV, 'Stake Trust', _buildStakeTrust(theme)),
            SpacerV.s(context),
            _buildStakingButtons(theme)
          ],
        ),
      ),
    );
  }

  Widget _buildLevel(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.emoji_events,
          color: Colors.yellow,
          size: w(context, 20),
        ),
        SizedBox(
          width: w(context, 10),
        ),
        Text(
          'Gold',
          style: theme.textTheme.headline2?.copyWith(
              color: Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildInfo(BuildContext context, ThemeData theme, Color chipColor,
      String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ColorChip(color: chipColor),
        SpacerV.c(context, 2.0),
        Text(
          title,
          style: theme.textTheme.headline2?.copyWith(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SpacerV.c(context, 2.0),
        Text(
          value,
          style: theme.textTheme.headline2?.copyWith(
              color: Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildStakingInfo(BuildContext context, ThemeData theme,
      Color chipColor, String title, Widget child) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ColorChip(color: chipColor),
        SpacerV.c(context, 2.0),
        Text(
          title,
          style: theme.textTheme.headline2?.copyWith(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SpacerV.c(context, 2.0),
        child
      ],
    );
  }

  Widget _buildDiscount(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '50%',
          style: theme.textTheme.headline2?.copyWith(
              color: Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: w(context, 10),
        ),
        new LinearPercentIndicator(
          barRadius: Radius.circular(15.0),
          width: w(context, 80),
          lineHeight: 10.0,
          percent: 0.5,
          backgroundColor: Constants.background_color,
          progressColor: Constants.neon_yellow,
        ),
      ],
    );
  }

  Widget _buildStakeTrust(ThemeData theme) {
    return Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.only(top: p(context, 8.0), right: p(context, 8.0)),
          child: TextFormField(
            style: theme.textTheme.headline1
                ?.copyWith(color: Colors.white, fontSize: f(context, 17)),
            keyboardType: TextInputType.number,
            validator: trustValidator,
            inputFormatters: stakeTrustFormatter(),
            decoration: InputDecoration(
              hintText: Constants.ENTER_AMOUNT_OF_TRUST,
              hintStyle: theme.textTheme.headline1?.copyWith(
                  color: Colors.grey[600],
                  fontSize: f(context, 17),
                  fontWeight: FontWeight.w400),
              fillColor: Constants.background_color,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ));
  }

  Widget _buildStakingButtons(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedGlowButton(
            widget: Text(
              Constants.STAKE,
              style: theme.textTheme.headline2
                  ?.copyWith(color: Colors.white, fontSize: f(context, 17)),
            ),
            buttonWidth: w(context, 125),
            buttonHeight: w(context, 50),
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [Constants.blue_violet, Constants.blue_violet]),
            glowColor: Constants.blue_violet,
            onPress: () {
              //TODO: Initiate smart contract to stake trust
            }),
        OutlinedGlowButton(
            widget: Text(
              Constants.UNSTAKE,
              style: theme.textTheme.headline2
                  ?.copyWith(color: Colors.white, fontSize: f(context, 17)),
            ),
            buttonWidth: w(context, 125),
            buttonHeight: w(context, 50),
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [Constants.blue_violet, Constants.blue_violet]),
            glowColor: Constants.blue_violet,
            onPress: () {
              //TODO: Initiate smart contract to unstake trust
            }),
      ],
    );
  }
}
