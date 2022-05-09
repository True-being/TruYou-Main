import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/gradient_chat_profile_picture.dart';
import 'package:truyou/screens/chats/chat_viewer.dart';

///Create a chat tile in chat_viewer > chats
class ChatItem extends StatelessWidget {
  final String imageURL;
  final String messageTitle;
  final String lastMessage;
  final String messageTime;
  final bool isOnline;

  //TODO: Create message object

  const ChatItem(
      {Key? key,
      required this.imageURL,
      required this.messageTitle,
      required this.lastMessage,
      required this.messageTime,
      required this.isOnline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Navigate to chat with ID
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ChatViewer(name: 'Jen Hawkins', imageURL: imageURL)));
      },
      child: Container(
        width: sWidth(context),
        height: h(context, 25),
        child: Padding(
            padding: EdgeInsets.all(p(context, 8.0)),
            child: Stack(
              children: [
                _buildChatTile(context),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(p(context, 8.0)),
                    child: Text(
                      messageTime + " ago",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: f(context, 12.0),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  //Builds the correct avatar based whether the user is online or not
  Widget _buildCircleAvatar(BuildContext context) {
    if (isOnline) {
      return GradientChatProfilePicture(imageURL: imageURL);
    } else {
      return Container(
        width: w(context, 70),
        height: w(context, 70),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(image: AssetImage(imageURL), fit: BoxFit.cover),
        ),
      );
    }
  }

  //Builds a list tile
  Widget _buildChatTile(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ListTile(
        leading: _buildCircleAvatar(context),
        title: _buildTitle(context),
        subtitle: _buildSubtitle(context),
        tileColor: Constants.background_color,
        contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
      ),
    );
  }

  //Builds the users name
  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(p(context, 4.0)),
      child: Text(
        messageTitle,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.grey[200],
            fontSize: f(context, 18.0),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  //Builds the last message
  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(p(context, 2.0)),
      child: Text(
        lastMessage,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.grey[500],
            fontSize: f(context, 16.0),
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
