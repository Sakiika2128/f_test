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

    Paint p = Paint();
    p.color = Color.fromARGB(255, 102, 205, 170);
    p.style = PaintingStyle.fill;
    canvas.drawPath(path, p);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}