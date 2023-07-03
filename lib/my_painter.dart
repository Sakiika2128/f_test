import 'dart:math';

import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    Path path = Path();
    Rect r = Rect.fromLTWH(50.0, 50.0, 75.0, 75.0);
    path.addOval(r);
    r = Rect.fromLTWH(75.0, 75.0, 125.0, 125.0);
    path.addOval(r);
    r = Rect.fromLTWH(125.0, 125.0, 175.0, 175.0);
    path.addOval(r);

    canvas.save();

    Paint p = Paint();
    p.color = Color.fromARGB(150, 240, 128, 128);
    p.style = PaintingStyle.fill;
    canvas.drawPath(path, p);

    canvas.translate(0.0, 100.0);
    p.color = Color.fromARGB(150, 255, 215, 0);
    canvas.drawPath(path, p);

    p.color = Color.fromARGB(150, 0, 191, 255);
    canvas.rotate(-0.5 * pi);
    canvas.translate(-400.0, 50.0);
    canvas.scale(1 * 1.5);
    canvas.drawPath(path, p);
    canvas.restore();

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}