import 'package:flutter/material.dart';



class DottedDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black // Adjust the color of the dots as needed
      ..strokeWidth = 2.0 // Adjust the thickness of the dots as needed
      ..strokeCap = StrokeCap.round;

    double dashWidth = 5.0; // Adjust the width of each dot as needed
    double dashSpace = 5.0; // Adjust the space between dots as needed

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawCircle(Offset(startX, size.height / 2), dashWidth / 2, paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
