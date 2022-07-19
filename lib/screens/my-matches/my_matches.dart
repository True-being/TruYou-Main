import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truyou/bloc/my_matches_bloc/my_matches_bloc.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/components/widgets/loader.dart';
import 'package:truyou/components/widgets/my_matches_card.dart';

class MyMatches extends StatefulWidget {
  const MyMatches({Key? key}) : super(key: key);

  @override
  State<MyMatches> createState() => _MyMatchesState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _MyMatchesState extends State<MyMatches> {
  final _myMatchesBloc = getit<MyMatchesBloc>();

  @override
  void initState() {
    _myMatchesBloc.add(MyMatchesEvent.loadMoreMatches([]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Constants.background_color,
        body: BlocBuilder<MyMatchesBloc, MyMatchesState>(
          bloc: _myMatchesBloc,
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => Loader(),
                failed: (exception) {
                  return Text(exception.toString());
                },
                success: (users, locations) {
                  return SingleChildScrollView(
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
                                          contentPadding: EdgeInsets.all(
                                              _size.width * 0.01),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: w(context, 1.5))),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
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
                              itemCount: users.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 11 / 16,
                                      crossAxisCount: 2),
                              itemBuilder: (BuildContext context, int index) {
                                return MyMatchesCard(
                                    imageURL: users[index].images!.first,
                                    name: users[index].firstName,
                                    age: DateHelper.getAge(
                                            users[index].birthDate)
                                        .toString(),
                                    location: locations[index],
                                    aboutMe: users[index].aboutMe);
                              }),
                        )
                      ],
                    ),
                  );
                },
                orElse: () {
                  return Container();
                });
          },
        ));
  }
}
