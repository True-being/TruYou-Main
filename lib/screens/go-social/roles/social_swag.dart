import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/custom_app_bar.dart';
import 'package:truyou/components/widgets/role_card.dart';

class SocialSwag extends StatefulWidget {
  const SocialSwag({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SocialSwag(),
      settings: const RouteSettings(name: Routes.socialSwag),
    );
  }

  @override
  State<SocialSwag> createState() => _SocialSwagState();
}

class _SocialSwagState extends State<SocialSwag> {
  List<RoleCard> buildRoles = [
    RoleCard(title: 'Vapor', imageURL: 'assets/vapor.jpg', isSelected: true),
    RoleCard(
        title: 'Dino', imageURL: 'assets/dino_nft.jpeg', isSelected: false),
    RoleCard(title: 'Buck', imageURL: 'assets/buck_nft.jpg', isSelected: false),
    RoleCard(
        title: 'Robot', imageURL: 'assets/robot_nft.png', isSelected: false),
  ];

  List<RoleCard> buildPurchaseRoles = [
    RoleCard(
        title: 'Vapor',
        imageURL: 'assets/vapor.jpg',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Dino',
        imageURL: 'assets/dino_nft.jpeg',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Buck',
        imageURL: 'assets/buck_nft.jpg',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Robot',
        imageURL: 'assets/robot_nft.png',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Vapor',
        imageURL: 'assets/vapor.jpg',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Dino',
        imageURL: 'assets/dino_nft.jpeg',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Buck',
        imageURL: 'assets/buck_nft.jpg',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Robot',
        imageURL: 'assets/robot_nft.png',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Vapor',
        imageURL: 'assets/vapor.jpg',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Dino',
        imageURL: 'assets/dino_nft.jpeg',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Buck',
        imageURL: 'assets/buck_nft.jpg',
        isSelected: false,
        roleType: RoleType.PURCHASE),
    RoleCard(
        title: 'Robot',
        imageURL: 'assets/robot_nft.png',
        isSelected: false,
        roleType: RoleType.PURCHASE),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Constants.background_color,
      appBar: customAppBar(
          context, Keys.socialSwagBackButton, Constants.SOCIAL_SWAG),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(p(context, 8.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCurrentRole(theme),
              _buildMyRoles(theme),
              _buildPurchaseRoles(theme)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentRole(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(left: p(context, 16.0), top: p(context, 16.0)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(p(context, 8.0)),
            child: Text(
              Constants.CURRENT_ROLE,
              style: theme.textTheme.headline6
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(p(context, 8.0)),
            child: _buildEmptyRole(
              context,
              Center(
                child: Text(Constants.NONE,
                    style: theme.textTheme.headline6?.copyWith(fontSize: 19)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMyRoles(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(left: p(context, 16.0), top: p(context, 16.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(p(context, 8.0)),
            child: Text(
              Constants.MY_ROLES,
              style: theme.textTheme.headline6
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [...buildRoles],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPurchaseRoles(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(left: p(context, 16.0), top: p(context, 16.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(p(context, 8.0)),
            child: Text(
              Constants.PURCHASE_ROLES,
              style: theme.textTheme.headline6
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          SingleChildScrollView(
            child: Wrap(
              children: [...buildPurchaseRoles],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEmptyRole(BuildContext context, Widget child) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      height: size.width * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Constants.purple, width: 2),
          boxShadow: [
            BoxShadow(
              color: Constants.purple,
              blurRadius: 1,
              spreadRadius: 1,
            )
          ],
          color: Constants.background_color),
      child: child,
    );
  }
}
