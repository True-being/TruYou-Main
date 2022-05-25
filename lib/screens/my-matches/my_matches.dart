import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/my_matches_card.dart';

class MyMatches extends StatefulWidget {
  const MyMatches({Key? key}) : super(key: key);

  @override
  State<MyMatches> createState() => _MyMatchesState();
}

const List<MyMatchesCard> matchCards = [
  //TODO: Change to network image
  MyMatchesCard(
      imageURL: 'assets/women1.jpg',
      matchPerc: 10,
      name: 'Michael Sharpie',
      age: '22',
      location: 'New Jersey, USA',
      aboutMe: 'I love racing cars to the max'),
  MyMatchesCard(
      imageURL: 'assets/women2.png',
      matchPerc: 98,
      name: 'Ishiya Hearts',
      age: '25',
      location: 'New Jersey, USA',
      aboutMe: 'The road takes me where I must go'),
  MyMatchesCard(
      imageURL: 'assets/man1.jpg',
      matchPerc: 75,
      name: 'Amber Evans',
      age: '26',
      location: 'Instanbul, Turkey',
      aboutMe: 'Beauty is in the eye of the beholder'),
  MyMatchesCard(
      imageURL: 'assets/women1.jpg',
      matchPerc: 100,
      name: 'Jared Miguel',
      age: '53',
      location: 'Texas, USA',
      aboutMe: 'Be the change you want to see in the world'),
  MyMatchesCard(
      imageURL: 'assets/women2.png',
      matchPerc: 50,
      name: 'Peggy Fines',
      age: '32',
      location: 'Tampa, Florida',
      aboutMe: 'I love all dogs to bits')
];

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _MyMatchesState extends State<MyMatches> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.background_color,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Search field
                  Form(
                    key: _formKey,
                    child: Container(
                        width: _size.width * 0.75,
                        height: _size.height * 0.045,
                        child: TextFormField(
                          inputFormatters: searchFormatter(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: _size.width * 0.04),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                CupertinoIcons.search,
                                color: Colors.white,
                                size: _size.width * 0.06,
                              ),
                              contentPadding:
                                  EdgeInsets.all(_size.width * 0.01),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: w(context, 1.5))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: w(context, 1.5))),
                              hintText: Constants.SEARCH,
                              hintStyle: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: _size.width * 0.05,
                                  fontWeight: FontWeight.w400)),
                        )),
                  ),
                  //Filter button
                  IconButton(
                      onPressed: () {
                        //TODO: Add filtering
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: _size.width * 0.07,
                      ))
                ],
              ),
            ),
            //Matches
            Container(
              width: _size.width,
              height: _size.height * 0.8,
              child: GridView.builder(
                  itemCount: matchCards.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 11 / 16, crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return matchCards[index];
                  }),
            )
          ],
        ),
      ),
    );
  }
}
