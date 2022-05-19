import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/screens/go-social/roles/purchase_role.dart';

enum RoleType { MY, PURCHASE }

class RoleCard extends StatelessWidget {
  final String title;
  final String imageURL;
  final bool isSelected;
  final RoleType? roleType;
  const RoleCard(
      {Key? key,
      required this.title,
      required this.imageURL,
      required this.isSelected,
      this.roleType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(p(context, 8.0)),
      child: GestureDetector(
        onTap: () {
          if (roleType != null) {
            if (roleType == RoleType.PURCHASE) {
              Navigator.push(context, PurchaseRole.route(title, imageURL));
            }
          }
        },
        child: Container(
          width: size.width * 0.25,
          height: size.width * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: isSelected
                  ? Border.all(color: Constants.purple, width: 2)
                  : null,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Constants.purple,
                        blurRadius: 1,
                        spreadRadius: 1,
                      )
                    ]
                  : null,
              image: DecorationImage(
                  image: AssetImage(imageURL), fit: BoxFit.cover),
              color: Constants.background_color),
        ),
      ),
    );
  }
}
