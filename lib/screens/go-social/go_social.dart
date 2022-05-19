import 'package:flutter/material.dart';
import 'package:truyou/screens/go-social/roles/social_swag.dart';

import '../../components/components.dart';

class GoSocial extends StatefulWidget {
  const GoSocial({Key? key}) : super(key: key);

  @override
  State<GoSocial> createState() => _GoSocialState();
}

class _GoSocialState extends State<GoSocial> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.background_color,
      body: Column(
        children: [
          _buildChatInfo(context, theme),
          _buildGetPerksButton(context, theme),
        ],
      ),
      bottomNavigationBar: _buildSendMessage(theme),
    );
  }

  Widget _buildChatInfo(BuildContext context, ThemeData theme) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: h(context, 15.0),
      color: Constants.dark_blue,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: p(context, 4.0)),
                child: Text(
                  Constants.CHATTING_AS + 'Matt',
                  style: theme.textTheme.headline6
                      ?.copyWith(color: Colors.grey[500]),
                ),
              ),
              Icon(
                Icons.edit,
                color: Colors.grey[500],
                size: w(context, 15),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.group,
                color: Colors.grey[500],
                size: w(context, 20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: p(context, 4.0)),
                child: Text(
                  '10 200' + ' ' + Constants.USERS,
                  style: theme.textTheme.headline6
                      ?.copyWith(color: Colors.grey[500]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGetPerksButton(BuildContext context, ThemeData theme) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        key: Key(Keys.getPerksButton),
        onTap: () {
          Navigator.push(context, SocialSwag.route());
        },
        child: Container(
          width: size.width,
          height: h(context, 15.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Constants.pink, Constants.sky_blue],
            ),
          ),
          child: Center(
            child: Text(
              Constants.GET_PERKS,
              style: theme.textTheme.headline6,
            ),
          ),
        ));
  }

  Widget _buildSendMessage(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.all(p(context, 8.0)),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: Constants.TYPE_A_MESSAGE,
            hintStyle:
                theme.textTheme.headline6?.copyWith(color: Colors.grey[600]),
            fillColor: Constants.dark_blue,
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
            suffixIcon: IconButton(
              onPressed: () {
                //TODO: Send message
              },
              icon: Icon(Icons.send, color: Constants.purple),
            )),
      ),
    );
  }
}
