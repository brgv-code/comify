// @dart=2.9

import 'package:camera/camera.dart';
import 'package:comify/screens/camera_screen.dart';
import 'package:comify/screens/homescreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Comify',
        theme: ThemeData(
            fontFamily: "OpenSans",
            primaryColor: Colors.blue[600],
            accentColor: Colors.blueAccent[100]),
        home: HomeScreen());
  }
}
