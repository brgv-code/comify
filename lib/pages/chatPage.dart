import 'package:comify/custom_ui/custom_card.dart';
import 'package:comify/model/chat_model.dart';
import 'package:comify/screens/select_contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: 'Comify',
        isGroup: false,
        currentMessage: 'Hi from Comify',
        time: '04:20',
        icon: 'person.svg'),
    ChatModel(
        name: 'Bhargav',
        isGroup: false,
        currentMessage: 'Hi from Bhargav',
        time: '02:47',
        icon: 'person.svg'),
    ChatModel(
        name: 'Some random group',
        isGroup: true,
        currentMessage: 'Some random message',
        time: '01:52',
        icon: 'groups.svg'),
    ChatModel(
        name: 'XOXO',
        isGroup: false,
        currentMessage: 'Ok',
        time: '10:40',
        icon: 'person.svg'),
    ChatModel(
        name: ':)',
        isGroup: false,
        currentMessage: 'Ok',
        time: '08:40',
        icon: 'person.svg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => SelectContact()));
            },
            child: Icon(Icons.chat, color: Colors.white)),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) =>
                CustomCard(chatModel: chats[index])));
  }
}
