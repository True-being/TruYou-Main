import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/gift_card.dart';

class ChooseGiftScreen extends StatefulWidget {
  final String receipient;
  const ChooseGiftScreen({Key? key, required this.receipient})
      : super(key: key);

  @override
  State<ChooseGiftScreen> createState() => _ChooseGiftScreenState();
}

class _ChooseGiftScreenState extends State<ChooseGiftScreen> {
  late List<GiftCard> _nfts;

  late List<GiftCard> _tokens;

  @override
  void initState() {
    _nfts = [
      GiftCard(
        receipient: widget.receipient,
        giftType: Gift.NFT,
        imageDir: 'assets/robot_nft.png',
        title: 'Robot NFT',
      ),
      GiftCard(
        receipient: widget.receipient,
        giftType: Gift.NFT,
        imageDir: 'assets/buck_nft.jpg',
        title: 'Buck NFT',
      ),
      GiftCard(
        receipient: widget.receipient,
        giftType: Gift.NFT,
        imageDir: 'assets/dino_nft.jpeg',
        title: 'Dino NFT',
      ),
      GiftCard(
        receipient: widget.receipient,
        giftType: Gift.NFT,
        imageDir: 'assets/robot_nft.png',
        title: 'Robot NFT',
      ),
    ];
    _tokens = [
      GiftCard(
        receipient: widget.receipient,
        giftType: Gift.TOKEN,
        imageDir: 'assets/ether.png',
        title: 'Asa Trust',
      ),
      GiftCard(
        receipient: widget.receipient,
        giftType: Gift.TOKEN,
        imageDir: 'assets/eye_token.jpg',
        title: 'Eye Token',
      ),
      GiftCard(
        receipient: widget.receipient,
        giftType: Gift.TOKEN,
        imageDir: 'assets/h_token.jpg',
        title: 'Hsh Token',
      ),
      GiftCard(
        receipient: widget.receipient,
        giftType: Gift.TOKEN,
        imageDir: 'assets/ether.png',
        title: 'Bash Token',
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.background_color,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                key: Key(Keys.sendTheUserAGiftBackButton),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: _size.width * 0.07,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(_size.width * 0.04),
                child: Text(
                  Constants.CHOOSE_A_GIFT_TO_SEND,
                  style: TextStyle(
                      color: Colors.white, fontSize: _size.width * 0.07),
                ),
              ),
              SizedBox(
                height: _size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: _size.width * 0.02,
                    horizontal: _size.width * 0.04),
                child: Text(
                  Constants.NFTS,
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: _size.width * 0.05),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(_size.width * 0.02),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [..._nfts],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(_size.width * 0.04),
                child: Text(
                  Constants.TOKENS,
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: _size.width * 0.05),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(_size.width * 0.02),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [..._tokens],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
