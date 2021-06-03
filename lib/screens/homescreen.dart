import 'package:comify/pages/camera_page.dart';
import 'package:comify/pages/chatPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // HomeScreen({required Key key}) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Comify'),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            // IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text('New Space'), value: 'New Space'),
                PopupMenuItem(child: Text('New Direct'), value: 'New Direct'),
                PopupMenuItem(child: Text('Comify Web'), value: 'Comify Web'),
                PopupMenuItem(child: Text('Saved Texts'), value: 'Saved Texts'),
                PopupMenuItem(child: Text('Settings'), value: 'Settings'),
              ];
            })
          ],
          bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS')
            ],
          )),
      body: TabBarView(
        controller: _controller,
        children: [CameraPage(), ChatPage(), Text('Status'), Text('Calls')],
      ),
    );
  }
}
