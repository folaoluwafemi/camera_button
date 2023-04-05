import 'package:camera_button/src/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraButtonApp extends StatelessWidget {
  const CameraButtonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      builder: (context, child) {
        return ScreenUtilInit(
          builder: (context, child) => child!,
          designSize: const Size(428, 926),
          child: child,
        );
      },
      home: const HomeScreen(),
    );
  }
}
