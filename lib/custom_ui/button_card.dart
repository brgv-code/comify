import 'package:comify/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonCard extends StatefulWidget {
  ButtonCard({Key? key, required this.name, required this.icon})
      : super(key: key);
  final String name;
  final IconData icon;
  @override
  _ButtonCardState createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(
          widget.icon,
          size: 26,
          color: Colors.white,
        ),
        // backgroundColor: Color(0xFF25D366),
        backgroundColor: Colors.blueAccent,
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
