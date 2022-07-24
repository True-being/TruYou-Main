import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcard/tcard.dart';
import 'package:truyou/bloc/find_matches_bloc/find_matches_bloc.dart';
import 'package:truyou/bloc/swipe_bloc/swipe_bloc.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/injector/injection_container.dart';
import 'package:truyou/components/widgets/loader.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';
import 'package:truyou/repository/user_repository.dart';
import 'package:truyou/screens/find-matches/error_screens/no_more_users.dart';

enum Cursor { startAt, startAfter }

class FindMatches extends StatefulWidget {
  const FindMatches({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FindMatches(),
      settings: const RouteSettings(name: '/find-matches'),
    );
  }

  @override
  State<FindMatches> createState() => _FindMatchesState();
}

class _FindMatchesState extends State<FindMatches> {
  final _findMatchesBloc = getit<FindMatchesBloc>();
  final _userRepository = getit<UserRepository>();
  final _swipeBloc = getit<SwipeBloc>();
  TCardController _controller = new TCardController();
  int? _leftDirection;
  int? _rightDirection;
  int _current = 0;

  @override
  void initState() {
    _loadMatches();
    super.initState();
  }

  _loadMatches() async {
    final user = await _userRepository.getUserInfo();
    _findMatchesBloc
        .add(FindMatchesEvent.loadMoreMatches(user.lastDate, Cursor.startAt));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.background_color,
        body: _buildSwiper(context),
      ),
    );
  }

  Widget _buildSwiper(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return BlocListener<SwipeBloc, SwipeState>(
      bloc: _swipeBloc,
      listener: (context, state) {
        state.maybeWhen(failed: (exception) => print(exception), orElse: () {});
      },
      child: BlocBuilder<FindMatchesBloc, FindMatchesState>(
          bloc: _findMatchesBloc,
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => Loader(),
                failed: (exception) {
                  return exception.maybeWhen(noMoreUserAvailable: () {
                    return NoMoreUsers();
                  }, orElse: () {
                    return Text(
                      'Unknown error',
                      style: theme.textTheme.headline3
                          ?.copyWith(color: Colors.white),
                    );
                  });
                },
                success: (users) {
                  return Center(
                    child: Container(
                        width: _size.width,
                        height: _size.height * 0.9,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SpacerV.m(context),
                              Listener(
                                onPointerMove: (PointerMoveEvent _event) {
                                  if (_event.delta.dy > 0) {
                                    setState(() {
                                      _leftDirection = 1;
                                      _rightDirection = null;
                                    });
                                  }
                                  if (_event.delta.dx > 0) {
                                    setState(() {
                                      _rightDirection = 2;
                                      _leftDirection = null;
                                    });
                                  }
                                },
                                child: TCard(
                                  size: Size(_size.width, _size.height * 0.7),
                                  cards: users.asSwipeCards(),
                                  controller: _controller,
                                  onForward: (index, info) {
                                    if (info.direction == SwipDirection.Left) {
                                      _current = index;
                                      _leftDirection = 0;
                                      _rightDirection = 0;
                                      if (index == users.length) {
                                        _swipeBloc.add(SwipeEvent.swipeLeft(
                                            users[_current - 1],
                                            users[_current - 1].createdAt));
                                      } else {
                                        _swipeBloc.add(SwipeEvent.swipeLeft(
                                            users[_current - 1],
                                            users[_current].createdAt));
                                      }
                                    }
                                    if (info.direction == SwipDirection.Right) {
                                      _current = index;
                                      _leftDirection = 0;
                                      _rightDirection = 0;
                                      if (index == users.length) {
                                        _swipeBloc.add(SwipeEvent.swipeRight(
                                            context,
                                            users[_current - 1],
                                            users[_current - 1].createdAt));
                                      } else {
                                        _swipeBloc.add(SwipeEvent.swipeRight(
                                            context,
                                            users[_current - 1],
                                            users[_current].createdAt));
                                      }
                                    }
                                  },
                                  onEnd: () {
                                    //TODO: Either load more documents or notify the user they are out of trust, and should pledge more
                                    _findMatchesBloc.add(
                                        FindMatchesEvent.loadMoreMatches(
                                            users[_current - 1].createdAt,
                                            Cursor.startAfter));
                                    _current = 0;
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularGlowButton(
                                    width: ResponsiveWidget.size(context,
                                        _size.width * 0.16, _size.width * 0.10),
                                    height: ResponsiveWidget.size(context,
                                        _size.width * 0.16, _size.width * 0.10),
                                    iconSize: ResponsiveWidget.size(
                                        context,
                                        _size.width * 0.09,
                                        _size.width * 0.045),
                                    iconColor: Constants.neon_red,
                                    icon: Icon(CupertinoIcons.clear),
                                    onPress: () {
                                      _current = _controller.index;
                                      _leftDirection = 0;
                                      _rightDirection = 0;
                                      _controller.forward(
                                          direction: SwipDirection.Left);
                                    },
                                  ),
                                  CircularGlowButton(
                                    width: ResponsiveWidget.size(context,
                                        _size.width * 0.16, _size.width * 0.10),
                                    height: ResponsiveWidget.size(context,
                                        _size.width * 0.16, _size.width * 0.10),
                                    iconSize: ResponsiveWidget.size(
                                        context,
                                        _size.width * 0.09,
                                        _size.width * 0.045),
                                    iconColor: Constants.neon_green,
                                    icon: Icon(CupertinoIcons.heart),
                                    onPress: () {
                                      _current = _controller.index;
                                      _leftDirection = 0;
                                      _rightDirection = 0;
                                      _controller.forward(
                                          direction: SwipDirection.Right);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  );
                },
                orElse: () {
                  return Container();
                });
          }),
    );
  }

//   Widget _buildButtons(BuildContext context, List<TruYouUser> users) {
//     final _size = MediaQuery.of(context).size;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CircularGlowButton(
//           width: ResponsiveWidget.size(
//               context, _size.width * 0.16, _size.width * 0.10),
//           height: ResponsiveWidget.size(
//               context, _size.width * 0.16, _size.width * 0.10),
//           iconSize: ResponsiveWidget.size(
//               context, _size.width * 0.09, _size.width * 0.045),
//           iconColor: Constants.neon_red,
//           icon: Icon(CupertinoIcons.clear),
//           onPress: () {
//             _current++;
//             _leftDirection = 0;
//             _rightDirection = 0;
//             if (_current == users.length) {
//               _swipeBloc.add(SwipeEvent.swipeLeft(
//                   users[_current - 1], users[_current - 1].createdAt));
//             } else {
//               print(_current);
//               _swipeBloc.add(SwipeEvent.swipeLeft(
//                   users[_current - 1], users[_current].createdAt));
//             }
//             _controller.forward(direction: SwipDirection.Left);
//           },
//         ),
//         CircularGlowButton(
//           width: ResponsiveWidget.size(
//               context, _size.width * 0.16, _size.width * 0.10),
//           height: ResponsiveWidget.size(
//               context, _size.width * 0.16, _size.width * 0.10),
//           iconSize: ResponsiveWidget.size(
//               context, _size.width * 0.09, _size.width * 0.045),
//           iconColor: Constants.neon_green,
//           icon: Icon(CupertinoIcons.heart),
//           onPress: () {
//             _current++;
//             _leftDirection = 0;
//             _rightDirection = 0;
//             if (_current == users.length) {
//               _swipeBloc.add(SwipeEvent.swipeRight(
//                   context, users[_current - 1], users[_current - 1].createdAt));
//             } else {
//               _swipeBloc.add(SwipeEvent.swipeRight(
//                   context, users[_current - 1], users[_current].createdAt));
//             }
//             _controller.forward(direction: SwipDirection.Right);
//           },
//         ),
//       ],
//     );
//   }
}
