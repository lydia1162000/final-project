import 'package:camera/camera.dart';
import 'package:colblindor2/screens/colorTexture/tflite_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class CameraHelper {
  static late CameraController camera;

  static bool isDetecting = false;
  static CameraLensDirection _direction = CameraLensDirection.back;
  static Future<void>? initializeControllerFuture;

  static Future<CameraDescription> _getCamera(CameraLensDirection dir) async {
    return await availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }

  static void initializeCamera() async {
    camera = CameraController(
        await _getCamera(_direction),
        defaultTargetPlatform == TargetPlatform.android
            ? ResolutionPreset.high
            : ResolutionPreset.low,
        enableAudio: false);
    initializeControllerFuture = camera.initialize().then((value) {
      camera.startImageStream((CameraImage image) {
        if (!TFLiteHelper.modelLoaded) return;
        if (isDetecting) return;
        isDetecting = true;
        try {
          TFLiteHelper.classifyImage(image);
        } catch (e) {
          print(e);
        }
      });
    });
  }
}
