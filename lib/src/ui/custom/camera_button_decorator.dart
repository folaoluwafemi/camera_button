part of '../home_screen.dart';

class CameraButtonDecorator extends StatefulWidget {
  const CameraButtonDecorator({Key? key}) : super(key: key);

  @override
  State<CameraButtonDecorator> createState() => _CameraButtonDecoratorState();
}

class _CameraButtonDecoratorState extends State<CameraButtonDecorator> {
  bool pressed = false;

  Future<void> setPressed() async {
    setState(() {
      pressed = true;
    });
    await Future<void>.delayed(const Duration(milliseconds: 100));
    setState(() {
      pressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Duration animationDuration = Duration(milliseconds: 130);
    return InkWell(
      onTapDown: (details) => setState(() {
        pressed = true;
      }),
      onTapUp: (details) => setState(() {
        pressed = false;
      }),
      onTap: setPressed,
      borderRadius: BorderRadius.circular(50),
      child: AnimatedPhysicalModel(
        duration: animationDuration,
        color: Colors.transparent,
        elevation: pressed ? 0 : 30,
        borderRadius: BorderRadius.circular(50),
        shape: BoxShape.rectangle,
        shadowColor: Colors.black.withOpacity(0.2),
        child: AnimatedContainer(
          duration: animationDuration,
          width: MediaQuery.of(context).size.width * (5 / 7),
          height: 120.h,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(50),
            gradient: RadialGradient(
              colors: [
                Colors.white.withOpacity(0.8),
                Colors.grey.withOpacity(0.8),
              ],
              stops: const [0.0, 1.0],
              center: Alignment.center,
              radius: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.4),
                spreadRadius: 4,
                blurRadius: 1,
                offset: const Offset(0, 0),
              ),
              if (!pressed)
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 6,
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: const CameraButton(),
        ),
      ),
    );
  }
}
