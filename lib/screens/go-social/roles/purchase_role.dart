import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/custom_app_bar.dart';

class PurchaseRole extends StatefulWidget {
  final String title;
  final String imageURL;
  const PurchaseRole({Key? key, required this.title, required this.imageURL})
      : super(key: key);

  static Route route(String title, String imageURL) {
    return MaterialPageRoute(
      builder: (_) => PurchaseRole(
        title: title,
        imageURL: imageURL,
      ),
      settings: const RouteSettings(name: Routes.purchaseRole),
    );
  }

  @override
  State<PurchaseRole> createState() => _PurchaseRoleState();
}

class _PurchaseRoleState extends State<PurchaseRole> {
  var _algoBalance = '52.6';
  var _price = '5';

  void _onPressedPurchaseRole(BuildContext context) {
    //TODO: Validate textfield
    CustomDialog.showConfirmPurchaseRole(context, widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background_color,
      appBar: customAppBar(
          context, Keys.purchaseRoleBackButton, Constants.PURCHASE_ROLE),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpacerV.m(context),
            _buildImage(),
            SpacerV.m(context),
            _buildPurchaseDetails(context)
          ],
        ),
      ),
      persistentFooterButtons: [_buildPurchaseButton(context)],
    );
  }

  Widget _buildImage() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: w(context, 128),
        height: w(context, 128),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(widget.imageURL))),
      ),
    );
  }

  Widget _buildPurchaseDetails(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: p(context, 8.0), horizontal: p(context, 20.0)),
            child: Text(
              Constants.YOUR_BALANCE,
              style: TextStyle(
                color: Colors.white,
                fontSize: f(context, 25),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: p(context, 8.0), horizontal: p(context, 20.0)),
            child: Text(
              '$_algoBalance ' + Constants.ALGO,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: f(context, 20),
              ),
            ),
          ),
        ),
        SpacerV.s(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: p(context, 16.0)),
          child: Container(
            width: _size.width,
            height: h(context, 20),
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15.0)),
            padding: EdgeInsets.symmetric(
                horizontal: p(context, 16.0), vertical: p(context, 8.0)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'x1 ' + widget.title,
                style: TextStyle(
                    color: Colors.grey[100], fontSize: f(context, 19.0)),
              ),
            ),
          ),
        ),
        SpacerV.s(context),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 0.0, horizontal: p(context, 25.0)),
            child: Text(
              '= $_price ${Constants.ALGO}',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: f(context, 15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPurchaseButton(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return GlowButton(
        key: Key('send-token-gift-button'),
        text: Constants.PURCHASE_ROLE,
        buttonWidth: _size.width,
        buttonHeight: _size.height * 0.07,
        onPress: () {
          _onPressedPurchaseRole(context);
        });
  }
}
