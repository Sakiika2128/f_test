import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 0, 200, 255);
    Rect r = Rect.fromLTWH(50, 50, 150, 150);
    canvas.drawRect(r, p);

    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(150, 200, 0, 255);
    r = Rect.fromLTWH(100, 100, 150, 150);
    p.strokeWidth = 10.0;
    canvas.drawRect(r, p);

  }
  @override 
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}