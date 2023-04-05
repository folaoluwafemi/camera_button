import 'package:camera_button/src/app/camera_button_app.dart';
import 'package:camera_button/src/utils/camera_utils.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraUtils.fetchCameraDescriptions();
  runApp(const CameraButtonApp());
}
