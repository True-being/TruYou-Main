import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truyou/bloc/my_matches_bloc/my_matches_bloc.dart';
import 'package:truyou/bloc/unmatch_bloc/unmatch_bloc.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/components/widgets/loader.dart';
import 'package:truyou/components/widgets/my_matches_card.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';

class MyMatches extends StatefulWidget {
  const MyMatches({Key? key}) : super(key: key);

  @override
  State<MyMatches> createState() => _MyMatchesState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _MyMatchesState extends State<MyMatches> {
  final _myMatchesBloc = getit<MyMatchesBloc>();

  final _scrollController = ScrollController();

  @override
  void initState() {
    _myMatchesBloc.add(MyMatchesEvent.loadMoreMatches(null, []));
    super.initState();
  }

  _handleNotification(ScrollNotification notification,
      DocumentSnapshot? documentSnapshot, List<TruYouUser> users) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0.00) {
      _myMatchesBloc
          .add(MyMatchesEvent.loadMoreMatches(documentSnapshot, users));
    }

    return false;
  }

  @override
  void dispose() {
    _myMatchesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
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
                success: (documentSnapshot, users, locations) {
                  if (users.isEmpty) {
                    return Center(
                      child: Text(
                        Constants.NO_MATCHES_CURRENTLY,
                        style: theme.textTheme.headline3
                            ?.copyWith(color: Colors.white),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: p(context, 4.0), top: p(context, 4.0)),
                      child: NotificationListener<ScrollNotification>(
                        onNotification: ((notification) => _handleNotification(
                            notification, documentSnapshot, users)),
                        child: GridView.builder(
                            controller: _scrollController,
                            itemCount: users.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 11 / 16,
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return MyMatchesCard(
                                user: users[index],
                                location: locations[index],
                                callback: () {
                                  _myMatchesBloc.add(
                                      MyMatchesEvent.loadMoreMatches(null, []));
                                },
                              );
                            }),
                      ),
                    );
                  }
                },
                orElse: () {
                  return Container();
                });
          },
        ));
  }
}


//!Add this in the future
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//Search field
//       Form(
//         key: _formKey,
//         child: Container(
//             width: _size.width * 0.75,
//             height: _size.height * 0.045,
//             child: TextFormField(
//               inputFormatters: searchFormatter(),
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: _size.width * 0.04),
//               decoration: InputDecoration(
//                   prefixIcon: Icon(
//                     CupertinoIcons.search,
//                     color: Colors.white,
//                     size: _size.width * 0.06,
//                   ),
//                   contentPadding: EdgeInsets.all(
//                       _size.width * 0.01),
//                   border: OutlineInputBorder(
//                       borderRadius:
//                           BorderRadius.circular(30.0),
//                       borderSide: BorderSide(
//                           color: Colors.white,
//                           width: w(context, 1.5))),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius:
//                           BorderRadius.circular(30.0),
//                       borderSide: BorderSide(
//                           color: Colors.white,
//                           width: w(context, 1.5))),
//                   hintText: Constants.SEARCH,
//                   hintStyle: TextStyle(
//                       color: Colors.grey[200],
//                       fontSize: _size.width * 0.05,
//                       fontWeight: FontWeight.w400)),
//             )),
//       ),
//       //Filter button
//       IconButton(
//           onPressed: () {
//             //TODO: Add filtering
//           },
//           icon: Icon(
//             Icons.more_vert,
//             color: Colors.white,
//             size: _size.width * 0.07,
//           ))
//     ],
//   ),
// ),
