import 'package:flutter/rendering.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4158333, size.height * 0.3571429);
    path0.lineTo(size.width * 0.5833333, size.height * 0.3557143);
    path0.lineTo(size.width * 0.6241667, size.height * 0.4971429);
    path0.lineTo(size.width * 0.3750000, size.height * 0.4971429);
    path0.lineTo(size.width * 0.4158333, size.height * 0.3571429);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
