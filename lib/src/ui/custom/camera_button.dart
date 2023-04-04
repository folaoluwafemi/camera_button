part of '../home_screen.dart';

class CameraButtonDecorator extends StatefulWidget {
  const CameraButtonDecorator({Key? key}) : super(key: key);

  @override
  State<CameraButtonDecorator> createState() => _CameraButtonDecoratorState();
}

class _CameraButtonDecoratorState extends State<CameraButtonDecorator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (5 / 7),
      height: 90.h,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(50),
        gradient: RadialGradient(
          colors: [
            Colors.white.withOpacity(0.8),
            Colors.white.withOpacity(0.2),
          ],
          stops: const [0.0, 1.0],
          center: Alignment.center,
          radius: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            spreadRadius: 4,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.red,
        ),
      ),
    );
  }
}



class CameraButton extends StatelessWidget {
  const CameraButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

