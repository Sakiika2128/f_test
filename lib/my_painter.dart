import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();

    p.style = PaintingStyle.stroke;
    p.strokeWidth = 5;
    p.color = Color.fromARGB(150, 0, 200, 255);
    for(var i = 0; i <= 10; i++){
      Rect r = Rect.fromLTRB(
        50.0 + 20 * i,
        50,
        50,
        250.0 - 20 * i
      );
      canvas.drawLine(r.topLeft, r.bottomRight, p);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}