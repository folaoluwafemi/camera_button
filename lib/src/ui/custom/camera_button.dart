part of '../home_screen.dart';

class CameraButton extends StatefulWidget {
  const CameraButton({Key? key}) : super(key: key);

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  late CameraController controller;

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
      await CameraUtils.fetchCameraDescriptions();
      final List<CameraDescription> cameraDescriptions = List.from(
        CameraUtils.cameraDescriptions,
      );
      controller = CameraController(
        cameraDescriptions.firstWhere(
          (element) => element.lensDirection == CameraLensDirection.front,
          orElse: () => cameraDescriptions[0],
        ),
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.65,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              child: initialized
                  ? controller.buildPreview()
                  : Container(
                      color: Colors.white,
                    ),
            ),
          ),
        ),
        Text(
          'Button',
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.grey[500]?.withOpacity(0.95),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
