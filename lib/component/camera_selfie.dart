import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umkm/utils/constant.dart';
import 'dart:math' as math;

class CameraSelfie extends StatefulWidget {
  const CameraSelfie({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<CameraSelfie> createState() => _CameraSelfieState();
}

class _CameraSelfieState extends State<CameraSelfie> {
  late CameraController _cameraController;

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    initCamera(widget.camera);
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      final navigator = Navigator.of(context);
      // await _cameraController.takePicture().then((value) async {
      //   navigator.pop();
      // });
      final XFile picture = await _cameraController.takePicture();
      navigator.pop(picture.path);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
        cameraDescription, ResolutionPreset.high,
        enableAudio: false);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          if (_cameraController.value.isInitialized)
            Transform.scale(
              scale: _cameraController.value.aspectRatio / deviceRatio,
              child: Transform.rotate(
                angle: -math.pi / -2,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _cameraController.value.aspectRatio,
                    child: CameraPreview(_cameraController),
                  ),
                ),
              ),
            )
          else
            Container(
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: Container(
                child: Image.asset(
              "assets/images/ic_outer_selfie.png",
              fit: BoxFit.fitWidth,
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              child: Center(
                child: IconButton(
                  onPressed: takePicture,
                  iconSize: 70,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.circle, color: ColorUI.PRIMARY),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
