import 'dart:ui';

import 'package:flutter/material.dart';

class OpenPainter extends CustomPainter {
  final List points;

  OpenPainter({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.black54
      ..strokeCap = StrokeCap.round //rounded points
      ..strokeWidth = 1;
    //draw points on canvas
    canvas.drawPoints(PointMode.points, points, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
