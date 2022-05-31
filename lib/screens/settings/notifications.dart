import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/custom_app_bar.dart';
import 'package:truyou/components/widgets/custom_switch.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);

  static MaterialPageRoute route() {
    return MaterialPageRoute(
        builder: (context) => Notifications(),
        settings: const RouteSettings(name: Routes.notifications));
  }

  //TODO: Load match values
  //TODO: Add initial values to CSwitch
  var _newMatchesEmail = false;
  var _newMessagesEmail = false;
  var _newMatchesPush = false;
  var _newMessagesPush = false;
  var _newUsersInAreaPush = false;
  var _inAppVibrationsPush = false;
  var _inAppSoundsPush = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.background_color,
      appBar: customAppBar(
          context, Keys.notificationsBackButton, Constants.NOTIFICATIONS),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CDivider(),
            _buildTitle(theme, context, Constants.EMAIL),
            _buildNotification(
                theme, context, Constants.NEW_MATCHES, (p0) => null),
            _buildNotification(
                theme, context, Constants.NEW_MESSAGES, (p0) => null),
            _buildTitle(theme, context, Constants.PUSH_NOTIFICATIONS),
            _buildNotification(
                theme, context, Constants.NEW_MATCHES, (p0) => null),
            _buildNotification(
                theme, context, Constants.NEW_MESSAGES, (p0) => null),
            _buildNotification(
                theme, context, Constants.NEW_USER_IN_AREA, (p0) => null),
            _buildNotification(
                theme, context, Constants.IN_APP_VIBRATIONS, (p0) => null),
            _buildNotification(
                theme, context, Constants.IN_APP_SOUNDS, (p0) => null),
          ],
        ),
      ),
      persistentFooterButtons: [
        SaveButton(onPressed: () {
          //TODO: Save values to database
        })
      ],
    );
  }

  Widget _buildTitle(ThemeData theme, BuildContext context, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpacerV.s(context),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: p(context, 10.0), horizontal: p(context, 16.0)),
          child: Text(
            title,
            style: theme.textTheme.headline2?.copyWith(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        CDivider(),
      ],
    );
  }

  Widget _buildNotification(ThemeData theme, BuildContext context, String title,
      Function(bool) active) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(p(context, 16.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.headline2?.copyWith(
                    color: Colors.grey[300],
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
              ),
              CSwitch(active: active)
            ],
          ),
        ),
        CDivider()
      ],
    );
  }
}
