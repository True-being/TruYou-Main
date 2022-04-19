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
  MyMatchesCard(
      imageURL:
          'https://i.picsum.photos/id/1005/5760/3840.jpg?hmac=2acSJCOwz9q_dKtDZdSB-OIK1HUcwBeXco_RMMTUgfY',
      matchPerc: 10,
      nameAge: 'Michael Sharpie, 22',
      location: 'New Jersey, USA',
      aboutMe: 'I love racing cars to the max'),
  MyMatchesCard(
      imageURL:
          'https://i.picsum.photos/id/1027/2848/4272.jpg?hmac=EAR-f6uEqI1iZJjB6-NzoZTnmaX0oI0th3z8Y78UpKM',
      matchPerc: 98,
      nameAge: 'Ishiya Hearts, 25',
      location: 'New Jersey, USA',
      aboutMe: 'The road takes me where I must go'),
  MyMatchesCard(
      imageURL:
          'https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk',
      matchPerc: 75,
      nameAge: 'Amber Evans, 26',
      location: 'Instanbul, Turkey',
      aboutMe: 'Beauty is in the eye of the beholder'),
  MyMatchesCard(
      imageURL:
          'https://i.picsum.photos/id/1035/5854/3903.jpg?hmac=DV0AS2MyjW6ddofvSIU9TVjj1kewfh7J3WEOvflY8TM',
      matchPerc: 100,
      nameAge: 'Jared Miguel, 22',
      location: 'Texas, USA',
      aboutMe: 'Be the change you want to see in the world'),
  MyMatchesCard(
      imageURL:
          'https://i.picsum.photos/id/1025/4951/3301.jpg?hmac=_aGh5AtoOChip_iaMo8ZvvytfEojcgqbCH7dzaz-H8Y',
      matchPerc: 50,
      nameAge: 'Peggy Fines, 32',
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
                                      width: _size.width * 0.002)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: _size.width * 0.002)),
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
