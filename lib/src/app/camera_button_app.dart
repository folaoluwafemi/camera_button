import 'package:camera_button/src/ui/home_screen.dart';
import 'package:flutter/material.dart';

class CameraButtonApp extends StatelessWidget {
  const CameraButtonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
