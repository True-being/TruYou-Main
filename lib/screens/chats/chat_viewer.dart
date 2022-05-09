import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/back_button.dart';

///The chat with messages between another user
class ChatViewer extends StatefulWidget {
  //TODO: Add chat ID and load chat room(Chat User Object)

  static MaterialPageRoute route() {
    return MaterialPageRoute(
        builder: (context) =>
            ChatViewer(name: 'Leo', imageURL: 'assets/women1.jpg'),
        settings: const RouteSettings(name: Routes.chatViewer));
  }

  final String name;
  final String imageURL;
  const ChatViewer({Key? key, required this.name, required this.imageURL})
      : super(key: key);

  @override
  State<ChatViewer> createState() => _ChatViewerState();
}

class _ChatViewerState extends State<ChatViewer> {
  var _hasChats = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background_color,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Constants.background_color,
        leading: CustomBackButton(key: Key(Keys.startConversationBackButton)),
        title: _buildUserProfile(w(context, 40), w(context, 40)),
      ),
      body: _buildChatViewBody(),
      bottomNavigationBar: _buildSendMessage(),
    );
  }

  Widget _buildChatViewBody() {
    if (!_hasChats) {
      return _buildEmptyChatBody();
    } else {
      return _buildChatBody();
    }
  }

  Widget _buildChatBody() {
    return Container();
  }

  Widget _buildEmptyChatBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildUserProfile(w(context, 100), w(context, 100),
              asset: 'assets/holo_women.png'),
          SpacerV.m(context),
          Text(
            Constants.SAY_HELLO + " " + widget.name,
            style: TextStyle(fontSize: f(context, 20), color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfile(double width, double height, {String? asset}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(asset ?? widget.imageURL), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      widget.name,
      style: TextStyle(color: Colors.white, fontSize: f(context, 16)),
    );
  }

  Widget _buildSendMessage() {
    return Padding(
      padding: EdgeInsets.all(p(context, 8.0)),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: Constants.TYPE_A_MESSAGE,
            hintStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: f(context, 16),
            ),
            fillColor: Constants.dark_blue,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.0),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                //TODO: Send message
              },
              icon: Icon(Icons.send, color: Constants.purple),
            )),
      ),
    );
  }
}
