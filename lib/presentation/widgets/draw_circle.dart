import 'package:flutter/material.dart';

class DrawCircle extends CustomPainter {
  late Paint _paint;
  Color color;
  double dx, dy, radius;

  DrawCircle(this.color, this.dx, this.dy, this.radius) {
    _paint = Paint()
      ..color = this.color
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //offset adalah posisi objek berdasarkan sumbu x dan sumbu y
    canvas.drawCircle(Offset(this.dx, this.dy), this.radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
