import 'package:comify/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactCard extends StatefulWidget {
  ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Colors.white,
                height: 30,
                width: 30,
              ),
              backgroundColor: Colors.blueGrey[200],
            ),
            widget.contact.select
                ? Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 11,
                        child:
                            Icon(Icons.check, color: Colors.white, size: 18)),
                  )
                : Container(),
          ],
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.contact.name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
        ],
      ),
      subtitle: Text(widget.contact.status, style: TextStyle(fontSize: 13)),
    );
  }
}
