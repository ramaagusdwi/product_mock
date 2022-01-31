import 'package:flutter/material.dart';

import 'draw_circle.dart';


class IconBackgroundCircle extends StatelessWidget {
  Color circleColor;
  Color iconColor;
  IconData iconData;
  double size;
  double dx, dy, radius;

  IconBackgroundCircle(
      {required this.circleColor,
      required this.iconColor,
      required this.iconData,
      required this.size,
      required this.dx,
      required this.dy,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
            painter:
                DrawCircle(this.circleColor, this.dx, this.dy, this.radius)),
        Icon(
          iconData,
          size: size,
          color: iconColor,
        ),
      ],
    );
  }
}
