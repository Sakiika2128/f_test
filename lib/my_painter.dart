import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 127, 255, 212);
    Offset ctr = Offset(100, 100);
    canvas.drawCircle(ctr, 80, p);

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(255, 255, 255, 0);
    Rect r = Rect.fromLTWH(100, 100, 200, 200);
    canvas.drawOval(r, p);

    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(255, 255, 192, 203);
    p.strokeWidth = 10;
    r = Rect.fromLTWH(100, 100, 100, 100);
    canvas.drawOval(r, p);

  }
  @override 
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}