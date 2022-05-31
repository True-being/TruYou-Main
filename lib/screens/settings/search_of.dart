import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:truyou/components/widgets/custom_app_bar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../components/components.dart';

enum Gender { men, women, everyone }

extension GenderString on Gender {
  String genderToString() {
    switch (this) {
      case Gender.men:
        return 'Men';
      case Gender.women:
        return 'Women';
      case Gender.everyone:
        return 'Everyone';
    }
  }
}

class SearchOf extends StatefulWidget {
  const SearchOf({Key? key}) : super(key: key);

  static MaterialPageRoute route() {
    return MaterialPageRoute(
        builder: (context) => SearchOf(),
        settings: const RouteSettings(name: Routes.inSearchOf));
  }

  @override
  State<SearchOf> createState() => _SearchOfState();
}

class _SearchOfState extends State<SearchOf> {
  Gender gender = Gender.men;
  SfRangeValues _values = SfRangeValues(18.0, 35.0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.background_color,
      appBar: customAppBar(
          context, Keys.inSearchOfBackButton, Constants.IN_SEARCH_OF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CDivider(),
            Padding(
              padding: EdgeInsets.all(p(context, 20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLookingForTitle(theme),
                  _buildSelectTitle(theme),
                  SpacerV.s(context),
                  _buildGenderCards(theme, context),
                ],
              ),
            ),
            CDivider(),
            Padding(
              padding: EdgeInsets.all(p(context, 20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAgeSpanTitle(theme),
                  SpacerV.l(context),
                  _buildAgeRangeSlider(theme),
                ],
              ),
            ),
            CDivider()
          ],
        ),
      ),
      persistentFooterButtons: [
        SaveButton(onPressed: () {
          //TODO: Save gender preference and age span
        })
      ],
    );
  }

  Widget _buildLookingForTitle(ThemeData theme) {
    return Text(
      Constants.I_AM_LOOKING_FOR,
      style: theme.textTheme.headline2?.copyWith(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildAgeSpanTitle(ThemeData theme) {
    return Text(
      Constants.AGE_SPAN,
      style: theme.textTheme.headline2?.copyWith(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildSelectTitle(ThemeData theme) {
    return Text(
      Constants.SELECT_ONLY_ONE,
      style: theme.textTheme.headline2?.copyWith(
          color: Colors.grey[400], fontSize: 17, fontWeight: FontWeight.w400),
    );
  }

  Widget _buildGenderCards(ThemeData theme, BuildContext context) {
    return Column(
      children: [
        _buildGenderCard(theme, context, Gender.men),
        _buildGenderCard(theme, context, Gender.women),
        _buildGenderCard(theme, context, Gender.everyone)
      ],
    );
  }

  Widget _buildAgeRangeSlider(ThemeData theme) {
    return SfRangeSliderTheme(
      data: SfRangeSliderThemeData(
        tooltipBackgroundColor: Constants.thumb_color,
      ),
      child: SfRangeSlider(
        min: 18.0,
        max: 99.0,
        values: _values,
        enableTooltip: true,
        numberFormat: NumberFormat(''),
        shouldAlwaysShowTooltip: true,
        activeColor: Constants.thumb_color,
        inactiveColor: Constants.track_color,
        tooltipShape: SfPaddleTooltipShape(),
        onChanged: (SfRangeValues values) {
          setState(() {
            _values = values;
          });
        },
      ),
    );
  }

  Widget _buildGenderCard(ThemeData theme, BuildContext context, Gender type) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: p(context, 8.0)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            gender = type;
          });
        },
        child: Container(
          width: size.width,
          height: h(context, 15),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: type == gender ? Constants.sky_blue : Colors.grey[500]!,
                width: 2),
          ),
          child: Center(
            child: Text(
              type.genderToString(),
              style: theme.textTheme.headline2?.copyWith(
                  color: type == gender ? Constants.sky_blue : Colors.grey[500],
                  fontSize: 19,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
