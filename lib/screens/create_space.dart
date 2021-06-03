import 'package:comify/custom_ui/avatar_card.dart';
import 'package:comify/custom_ui/button_card.dart';
import 'package:comify/custom_ui/contact_card.dart';
import 'package:comify/model/chat_model.dart';
import 'package:flutter/material.dart';

class CreateSpace extends StatefulWidget {
  CreateSpace({Key? key}) : super(key: key);

  @override
  _CreateSpaceState createState() => _CreateSpaceState();
}

class _CreateSpaceState extends State<CreateSpace> {
  List<ChatModel> contacts = [
    ChatModel(name: "Bhargav", status: 'Hi from the dark side'),
    ChatModel(name: "XOXO", status: 'Hi from the dark side'),
    ChatModel(name: "Random", status: 'Hi from the dark side'),
    ChatModel(name: "That", status: 'Hi from the dark side')
  ];
  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Space',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                'Add parcitipants',
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groups.length > 0 ? 90 : 8,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        if (contacts[index - 1].select == false) {
                          setState(() {
                            contacts[index - 1].select = true;
                            groups.add(contacts[index - 1]);
                          });
                        } else {
                          setState(() {
                            contacts[index - 1].select = false;
                            groups.remove(contacts[index - 1]);
                          });
                        }
                      },
                      child: ContactCard(contact: contacts[index - 1]));
                }),
            groups.length > 0
                ? Column(children: [
                    Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].select == true) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      groups.remove(contacts[index]);
                                      contacts[index].select = false;
                                    });
                                  },
                                  child: AvatarCard(contact: contacts[index]));
                            } else {
                              return Container();
                            }
                          },
                        )),
                    Divider(thickness: 1),
                  ])
                : Container()
          ],
        ));
  }
}
