import 'package:comify/model/chat_model.dart';
import 'package:comify/pages/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:emoji_picker/emoji_picker.dart';

class IndividualPage extends StatefulWidget {
  IndividualPage({Key? key, required this.chatModel}) : super(key: key);

  final ChatModel chatModel;
  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leadingWidth: 70,
          titleSpacing: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back, size: 24),
                  CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                      child: SvgPicture.asset(
                        widget.chatModel.isGroup
                            ? "assets/groups.svg"
                            : "assets/person.svg",
                        color: Colors.white,
                        height: 36,
                        width: 36,
                      ))
                ],
              )),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(6),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.chatModel.name,
                        style: TextStyle(
                            fontSize: 18.5, fontWeight: FontWeight.bold)),
                    Text('last seen today at 12:05 PM',
                        style: TextStyle(fontSize: 13))
                  ]),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    child: Text('View Profile'), value: 'View Profile'),
                PopupMenuItem(
                    child: Text('Media, links and docs'),
                    value: 'Media, links and docs'),
                PopupMenuItem(child: Text('Comify Web'), value: 'Comify Web'),
                PopupMenuItem(child: Text('Saved Texts'), value: 'Saved Texts'),
                PopupMenuItem(child: Text('Settings'), value: 'Settings'),
              ];
            })
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WillPopScope(
            child: Stack(children: [
              ListView(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Type a message',
                                      contentPadding: EdgeInsets.all(5),
                                      prefixIcon: IconButton(
                                        icon:
                                            Icon(Icons.emoji_emotions_outlined),
                                        onPressed: () {
                                          setState(() {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            showEmoji = !showEmoji;
                                          });
                                        },
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              icon: Icon(Icons.attach_file),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (builder) =>
                                                        bottomSheet());
                                              }),
                                          IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, right: 5, left: 2),
                            child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.blueAccent[100],
                                child: IconButton(
                                  icon: Icon(Icons.mic, color: Colors.white),
                                  onPressed: () {},
                                )),
                          )
                        ],
                      ),
                      showEmoji ? emojiSelect() : Container()
                    ],
                  ))
            ]),
            onWillPop: () {
              if (showEmoji) {
                setState(() {
                  showEmoji = false;
                });
              } else {
                Navigator.pop(context);
              }
              return Future.value(false);
            },
          ),
        ));
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
          margin: EdgeInsets.all(18),
          child: Column(children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconBottomSheet(
                    Icons.insert_drive_file, Colors.indigo, 'Document'),
                SizedBox(width: 40),
                iconBottomSheet(Icons.camera_alt, Colors.pink, 'Camera'),
                SizedBox(width: 40),
                iconBottomSheet(Icons.insert_photo, Colors.purple, 'Gallery'),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconBottomSheet(Icons.headset, Colors.orange, 'Audio'),
                SizedBox(width: 40),
                iconBottomSheet(Icons.location_pin, Colors.teal, 'Location'),
                SizedBox(width: 40),
                iconBottomSheet(Icons.person, Colors.blue, 'Contact'),
              ],
            )
          ])),
    );
  }

  Widget iconBottomSheet(IconData icon, Color bgColor, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundColor: bgColor,
              child: Icon(
                icon,
                size: 29,
                color: Colors.white,
              )),
          Text(text)
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        numRecommended: 10,
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });
        });
  }
}
