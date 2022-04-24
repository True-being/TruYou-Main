import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/screens/gift-screens/send-gift-screens/nft_gift.dart';
import 'package:truyou/screens/gift-screens/send-gift-screens/token_gift.dart';

enum Gift { TOKEN, NFT }

class GiftCard extends StatelessWidget {
  final String imageDir;
  final String title;
  final Gift giftType;
  final String receipient;
  const GiftCard(
      {Key? key,
      required this.imageDir,
      required this.title,
      required this.giftType,
      required this.receipient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(_size.width * 0.02),
        child: GestureDetector(
          onTap: () {
            if (giftType == Gift.TOKEN) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TokenGiftScreen(
                        imagePath: imageDir,
                        title: title,
                        receipient: receipient,
                      )));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NFTGiftScreen(
                        imagePath: imageDir,
                        title: title,
                        receipient: receipient,
                      )));
            }
          },
          child: Column(children: [
            Container(
              width: w(context, 100),
              height: w(context, 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(imageDir),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(p(context, 8.0)),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: w(context, 16)),
              ),
            ),
          ]),
        ));
  }
}
