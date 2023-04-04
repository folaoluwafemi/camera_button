part of '../home_screen.dart';

class CameraButton extends StatefulWidget {
  const CameraButton({Key? key}) : super(key: key);

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  late final CameraController controller;

  bool initialized = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      final List<CameraDescription> cameraDescriptions =
          await availableCameras();

      print('camera descriptions: $cameraDescriptions');

      controller = CameraController(
        cameraDescriptions[0],
        ResolutionPreset.max,
        enableAudio: true,
        imageFormatGroup: ImageFormatGroup.unknown,
      );
      await controller.initialize();
      if (mounted) {
        setState(() {
          initialized = true;
        });
      }
    } catch (e, stacktrace) {
      if (e is CameraException) {
        debugPrint(
          'camera exception occurred: ${e.code} ${e.description}, stacktrace: $stacktrace',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(
          child: initialized
              ? CameraPreview(
                  controller,
                )
              : Container(
                  color: Colors.black45,
                ),
        ),
      ),
    );
  }
}
