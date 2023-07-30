import 'package:flutter/material.dart';
import 'dart:math';

class CirclePainter extends CustomPainter {
  final double rotationAngle;

  CirclePainter(this.rotationAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paint = Paint();

    // Define colors for each section
    final colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow];

    // The starting angle for each section (adjusted by rotationAngle)
    final startAngles = [0.0, pi / 2, pi, 3 * pi / 2];

    for (int i = 0; i < 4; i++) {
      const sweepAngle = pi / 2; // 90 degrees
      paint.color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngles[i] + rotationAngle,
        sweepAngle,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}