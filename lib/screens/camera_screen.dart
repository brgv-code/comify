import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;

  late Future<void> cameraValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.flash_off,
                              color: Colors.white, size: 28)),
                      InkWell(
                          onTap: () {},
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.panorama_fish_eye,
                                  color: Colors.white, size: 70))),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.flip_camera_ios,
                              color: Colors.white, size: 28))
                    ],
                  ),
                  SizedBox(height: 4),
                  Text('Hold for Video, or tap for photo',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
