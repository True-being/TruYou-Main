import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/models/truyou_user/truyou_user_model.dart';

class MyMatchesCard extends StatefulWidget {
  final TruYouUser user;
  final String location;
  final VoidCallback callback;
  const MyMatchesCard(
      {Key? key,
      required this.user,
      required this.location,
      required this.callback})
      : super(key: key);

  @override
  State<MyMatchesCard> createState() => _MyMatchesCardState();
}

class _MyMatchesCardState extends State<MyMatchesCard> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(_size.width * 0.025),
      child: GestureDetector(
        onTap: () {
          CustomDialog.showMatchOptionDialog(
              context, widget.user, widget.callback);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: new NetworkImage(widget.user.images!.first),
                  fit: BoxFit.cover)),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(_size.width * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: _size.width * 0.01),
                    child: Text(
                      widget.user.firstName +
                          ', ' +
                          DateHelper.getAge(widget.user.birthDate).toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: _size.width * 0.04,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: _size.width * 0.01),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: _size.width * 0.035,
                            ),
                          ),
                          SizedBox(
                            width: _size.width * 0.005,
                          ),
                          Expanded(
                            flex: 6,
                            child: Text(
                              widget.location,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _size.width * 0.03,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: _size.width * 0.01),
                    child: Text(
                      widget.user.aboutMe ?? '',
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: _size.width * 0.025,
                          fontWeight: FontWeight.w300,
                          overflow: TextOverflow.ellipsis),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
