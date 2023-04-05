import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';

abstract class CameraUtils {
  static List<CameraDescription> cameraDescriptions = [];

  static Future<void> fetchCameraDescriptions() async {
    try {
      CameraUtils.cameraDescriptions = await availableCameras();
      print('camera description: $cameraDescriptions');
      if (CameraUtils.cameraDescriptions.isEmpty) {
        throw Exception('No camera found');
      }
    } catch (e) {
      debugPrint('camera error: $e');
    }
  }
}
