import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truyou/bloc/auth_bloc/auth_bloc.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/screens/screens.dart';
import 'package:truyou/screens/settings/connected_accounts.dart';
import 'package:truyou/screens/settings/location_settings.dart';
import 'package:truyou/screens/settings/notifications.dart';
import 'package:truyou/screens/settings/search_of.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _authBloc = getit<AuthBloc>();

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.background_color,
      body: BlocListener<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          state.maybeWhen(
            unAuthenticatedAuthentication: () {
              Navigator.pushAndRemoveUntil(
                  context, WelcomeScreen.route(), (route) => false);
            },
            orElse: () {},
          );
        },
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: EdgeInsets.all(p(context, 28.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildGeneralInfoTitle(theme),
                SpacerV.s(context),
                _buildGeneralInfoCard(
                    theme, 'joesoap@gmail.com'),
                SpacerV.m(context),
                _buildAdvancedInfoTitle(theme),
                SpacerV.s(context),
                _buildAdvancedInfoCards(theme, context),
                SpacerV.m(context),
                _buildMoreInfoTitle(theme),
                SpacerV.s(context),
                _buildMoreCards(theme, _authBloc)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGeneralInfoTitle(ThemeData theme) {
    return Text(
      Constants.GENERAL_INFO,
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.white,
        fontSize: 23,
      ),
    );
  }

  Widget _buildAdvancedInfoTitle(ThemeData theme) {
    return Text(
      Constants.ADVANCED,
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.white,
        fontSize: 23,
      ),
    );
  }

  Widget _buildMoreInfoTitle(ThemeData theme) {
    return Text(
      Constants.MORE,
      style: theme.textTheme.headline1?.copyWith(
        color: Colors.white,
        fontSize: 23,
      ),
    );
  }

  Widget _buildGeneralInfoCard(
      ThemeData theme, String email) {
    var _size = MediaQuery.of(context).size;
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
              color: Constants.sky_blue.withOpacity(0.7),
              blurRadius: 3.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGeneralInfo(theme, Constants.EMAIL, email),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvancedInfoCards(ThemeData theme, BuildContext context) {
    return Column(
      children: [
        _buildSettingCard(theme, Keys.connectedAccountsSettingsButton,
            Constants.CONNECTED_ACCOUNTS, () {
          Navigator.push(context, ConnectedAccounts.route());
        }, true),
        _buildSettingCard(
            theme, null, Constants.PREMIUM_FEATURES, () {}, false),
        _buildSettingCard(theme, null, Constants.GO_SOCIAL, () {}, false),
        _buildSettingCard(
            theme, Keys.locationSettingsSettingButton, Constants.LOCATION, () {
          Navigator.push(context, LocationSettings.route());
        }, true),
        _buildSettingCard(
            theme, Keys.inSearchOfSettingsButton, Constants.IN_SEARCH_OF, () {
          Navigator.push(context, SearchOf.route());
        }, true),
        _buildSettingCard(
            theme, Keys.notificationsSettingsButton, Constants.NOTIFICATIONS,
            () {
          Navigator.push(context, Notifications.route());
        }, true),
      ],
    );
  }

  Widget _buildMoreCards(ThemeData theme, AuthBloc authBloc) {
    return Column(
      children: [
        _buildSettingCard(theme, null, Constants.CONTACT_US, () {}, false),
        _buildSettingCard(theme, null, Constants.COMMUNITY_RULES, () {}, false),
        _buildSettingCard(theme, null, Constants.PRIVACY_POLICY, () {}, false),
        _buildSettingCard(
            theme, null, Constants.TERMS_OF_SERVICES, () {}, false),
        SpacerV.m(context),
        _buildSettingCard(theme, null, Constants.LOG_OUT, () {
          authBloc.add(const AuthEvent.userLogOut());
        }, false, centerAlign: true),
      ],
    );
  }

  Widget _buildGeneralInfo(ThemeData theme, String title, String details) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.headline2?.copyWith(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SpacerV.c(context, 2.0),
        Text(
          details,
          style: theme.textTheme.headline2?.copyWith(
              color: Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildSettingCard(ThemeData theme, String? key, String title,
      VoidCallback onPressed, bool displayMoreIcon,
      {bool centerAlign = false}) {
    var _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: p(context, 5.0)),
      child: GestureDetector(
        key: Key(key ?? ''),
        onTap: () {
          onPressed.call();
        },
        child: Container(
          width: _size.width,
          padding: EdgeInsets.symmetric(
              vertical: p(context, 16.0), horizontal: p(context, 16.0)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Constants.dark_blue,
            boxShadow: [
              BoxShadow(
                color: centerAlign
                    ? Colors.red[400]!
                    : Constants.sky_blue.withOpacity(0.7),
                blurRadius: 3.0,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(p(context, 4.0)),
            child: Row(
              mainAxisAlignment: centerAlign
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.headline2?.copyWith(
                      color: centerAlign ? Colors.red[400] : Colors.grey[400],
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                displayMoreIcon
                    ? Icon(
                        CupertinoIcons.forward,
                        color: Colors.grey[400],
                        size: w(context, 20),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
