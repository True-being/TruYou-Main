import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:truyou/bloc/gender_age_bloc/gender_age_bloc.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/components/widgets/custom_app_bar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';

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

  String genderToDatabaseString() {
    switch (this) {
      case Gender.men:
        return 'Male';
      case Gender.women:
        return 'Female';
      case Gender.everyone:
        return 'Everyone';
    }
  }
}

extension GenderFromString on String {
  Gender genderFromString() {
    switch (this) {
      case 'Male':
        return Gender.men;
      case 'Female':
        return Gender.women;
      case 'Everyone':
        return Gender.everyone;
      default:
        return Gender.everyone;
    }
  }
}

class SearchOf extends StatefulWidget {
  final TruYouUser user;

  const SearchOf({Key? key, required this.user}) : super(key: key);

  static MaterialPageRoute route(TruYouUser user) {
    return MaterialPageRoute(
        builder: (context) => SearchOf(user: user),
        settings: const RouteSettings(name: Routes.inSearchOf));
  }

  @override
  State<SearchOf> createState() => _SearchOfState();
}

class _SearchOfState extends State<SearchOf> {
  final _genderAgeBloc = getit<GenderAgeBloc>();

  late Gender gender;
  late SfRangeValues _values;

  @override
  void initState() {
    _setAgeValues();
    gender = widget.user.genderPreference!.genderFromString();
    super.initState();
  }

  Future<void> _setAgeValues() async {
    final lowerAge = DateHelper.getAge(widget.user.lowerAgePreference!);
    final upperAge = DateHelper.getAge(widget.user.upperAgePreference!);
    _values = SfRangeValues(lowerAge, upperAge);
  }

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
        onChangeEnd: (values) {
          if (values.start is double && values.end is double) {
            _genderAgeBloc.add(GenderAgeEvent.updateAgePreferences(
                DateHelper.ageToDate(values.start.toInt()),
                DateHelper.ageToDate(values.end.toInt())));
          }
        },
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
          _genderAgeBloc.add(GenderAgeEvent.updateGenderPreference(
              type.genderToDatabaseString()));
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
