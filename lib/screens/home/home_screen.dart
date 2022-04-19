import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:truyou/components/widgets/dialogs/match_option_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: '/home-screen'),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SwipeableCardSectionController _cardSectionController =
      SwipeableCardSectionController();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.background_color,
        body: Column(
          children: [
            //Swipeable stack
            SwipeableCardsSection(
              cardWidthTopMul: ResponsiveWidget.size(context, 0.9, 0.4),
              cardWidthMiddleMul: ResponsiveWidget.size(context, 0.8, 0.3),
              cardWidthBottomMul: ResponsiveWidget.size(context, 0.7, 0.2),
              cardHeightBottomMul: ResponsiveWidget.size(context, 0.61, 0.51),
              cardHeightMiddleMul: ResponsiveWidget.size(context, 0.62, 0.52),
              cardHeightTopMul: ResponsiveWidget.size(context, 0.67, 0.57),
              cardController: _cardSectionController,
              context: context,
              items: [
                SwipeCard(
                    image: 'assets/man1.jpg',
                    title: 'Daniel Levato, 22',
                    description: 'Sr. UX Designer'),
                SwipeCard(
                    image: 'assets/women1.jpg',
                    title: 'Freya Bartley, 34',
                    description: 'Small business owner'),
                SwipeCard(
                    image: 'assets/women2.png',
                    title: 'Shriya Williams, 28',
                    description: 'Team Manager')
              ],
              onCardSwiped: (dir, index, widget) {
                _cardSectionController.addItem(SwipeCard(
                    image: 'assets/women2.png',
                    title: 'Shriya Williams,28',
                    description: 'Team Manager'));

                //Take action on the swiped widget based on the direction of swipe
              },
              enableSwipeUp: false,
              enableSwipeDown: false,
            ),
            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TODO: Switch Red and green button; switch direction of arrow
                CircularGlowButton(
                  width: ResponsiveWidget.size(
                      context, _size.width * 0.12, _size.width * 0.08),
                  height: ResponsiveWidget.size(
                      context, _size.width * 0.1, _size.width * 0.06),
                  iconSize: ResponsiveWidget.size(
                      context, _size.width * 0.07, _size.width * 0.035),
                  iconColor: Constants.neon_red,
                  icon: Icon(CupertinoIcons.clear),
                  onPress: () {
                    _cardSectionController.triggerSwipeLeft();
                  },
                ),
                CircularGlowButton(
                  width: ResponsiveWidget.size(
                      context, _size.width * 0.16, _size.width * 0.10),
                  height: ResponsiveWidget.size(
                      context, _size.width * 0.16, _size.width * 0.10),
                  iconSize: ResponsiveWidget.size(
                      context, _size.width * 0.09, _size.width * 0.045),
                  iconColor: Constants.neon_green,
                  icon: Icon(CupertinoIcons.heart),
                  onPress: () {
                    _cardSectionController.triggerSwipeRight();
                  },
                ),
                CircularGlowButton(
                  width: ResponsiveWidget.size(
                      context, _size.width * 0.12, _size.width * 0.08),
                  height: ResponsiveWidget.size(
                      context, _size.width * 0.1, _size.width * 0.06),
                  iconSize: ResponsiveWidget.size(
                      context, _size.width * 0.07, _size.width * 0.035),
                  iconColor: Constants.neon_yellow,
                  icon: Icon(CupertinoIcons.arrow_right),
                  onPress: () {
                    //Load cached previous profile
                    MatchOptionDialog.showOptionDialog(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
