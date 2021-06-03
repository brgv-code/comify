import 'package:comify/model/chat_model.dart';
import 'package:comify/screens/individual_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IndividualPage(
                        chatModel: chatModel,
                      )));
        },
        child: Column(
          children: [
            ListTile(
                leading: CircleAvatar(
                    radius: 30,
                    child: SvgPicture.asset(
                      chatModel.isGroup
                          ? "assets/groups.svg"
                          : "assets/person.svg",
                      color: Colors.white,
                      height: 37,
                      width: 37,
                    ),
                    backgroundColor: Colors.blueGrey),
                trailing: Text(chatModel.time),
                title: Text(chatModel.name,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Row(children: [
                  Icon(Icons.done_all),
                  SizedBox(width: 3),
                  Text(chatModel.currentMessage, style: TextStyle(fontSize: 13))
                ])
                // subtitle: Text('Hi from COMIFY', style: TextStyle(
                //   fontSize: 13
                // ))
                ),
            Padding(
                padding: const EdgeInsets.only(right: 20, left: 80),
                child: Divider(thickness: 1.5))
          ],
        ));
  }
}
