import 'package:comify/custom_ui/button_card.dart';
import 'package:comify/custom_ui/contact_card.dart';
import 'package:comify/model/chat_model.dart';
import 'package:comify/screens/create_space.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: "Bhargav", status: 'Hi from the dark side'),
      ChatModel(name: "XOXO", status: 'Hi from the dark side'),
      ChatModel(name: "Random", status: 'Hi from the dark side'),
      ChatModel(name: "That", status: 'Hi from the dark side')
    ];
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Contact',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                '256 contacts',
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    child: Text('Invite a friend'), value: 'Invite a friend'),
                PopupMenuItem(child: Text('Contacts'), value: 'Contacts'),
                PopupMenuItem(child: Text('Refresh'), value: 'Refresh'),
                PopupMenuItem(child: Text('Help'), value: 'Help'),
              ];
            })
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => CreateSpace()));
                    },
                    child: ButtonCard(icon: Icons.group, name: 'New Space'));
              } else if (index == 1) {
                return ButtonCard(icon: Icons.group, name: 'New Contact');
              }
              return ContactCard(contact: contacts[index - 2]);
            }));
  }
}
