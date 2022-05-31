import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/custom_app_bar.dart';

class ConnectedAccounts extends StatefulWidget {
  const ConnectedAccounts({Key? key}) : super(key: key);

  static MaterialPageRoute route() {
    return MaterialPageRoute(
        builder: (context) => ConnectedAccounts(),
        settings: const RouteSettings(name: Routes.connectedAccounts));
  }

  @override
  State<ConnectedAccounts> createState() => _ConnectedAccountsState();
}

class _ConnectedAccountsState extends State<ConnectedAccounts> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.background_color,
      appBar: customAppBar(context, Keys.connectedAccountsBackButton,
          Constants.CONNECTED_ACCOUNTS),
      body: Padding(
        padding: EdgeInsets.all(p(context, 16.0)),
        child: Column(
          children: [
            _buildPeroContainer(theme, context),
            SpacerV.s(context),
            _buildLogOutButton(theme)
          ],
        ),
      ),
    );
  }

  Widget _buildLogOutButton(ThemeData theme) {
    return Align(
      alignment: Alignment.topRight,
      child: GlowButton(
          text: Constants.LOG_OUT,
          buttonWidth: w(context, 125),
          buttonHeight: w(context, 50),
          gradients: [Constants.pink, Constants.pink],
          centerAlign: true,
          onPress: () {
            //TODO: Log person out of there perra account
          }),
    );
  }

  Widget _buildPeroContainer(ThemeData theme, BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: p(context, 5.0)),
      child: Container(
        width: _size.width,
        padding: EdgeInsets.symmetric(
            vertical: p(context, 16.0), horizontal: p(context, 16.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Constants.dark_blue,
        ),
        child: GestureDetector(
          onTap: () {
            //TODO: Log in through perro
          },
          child: Padding(
            padding: EdgeInsets.all(p(context, 4.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constants.PERA,
                  style: theme.textTheme.headline2?.copyWith(
                      color: Colors.grey[400],
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: Colors.grey[400],
                  size: w(context, 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
