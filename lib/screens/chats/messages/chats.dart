import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/widgets/chat_item.dart';

///Chats tab
class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<ChatItem> items = [
    ChatItem(
      imageURL: 'assets/women1.jpg',
      messageTitle: 'Jen',
      lastMessage: 'Hey! Did you checkout the news?',
      messageTime: '5m',
      isOnline: true,
    ),
    ChatItem(
      imageURL: 'assets/man1.jpg',
      messageTitle: 'Mark',
      lastMessage: 'Do you wanna have drinks tonight?',
      messageTime: '16h',
      isOnline: true,
    ),
    ChatItem(
      imageURL: 'assets/women2.png',
      messageTitle: 'Jessie',
      lastMessage: 'Yeah Jessie, I dont think thats the best option...',
      messageTime: '3d',
      isOnline: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.background_color,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: 3,
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              color: Colors.grey[700],
            );
          },
          itemBuilder: (context, index) {
            return items[index];
          }),
    );
  }
}
