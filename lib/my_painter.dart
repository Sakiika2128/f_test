import 'dart:math';

import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter{
  final double value;
  MyPainter(this.value);

  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();
    canvas.save();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(100, 255, 255, 0);
    Rect r = Rect.fromLTWH(0, 0, 200, 200);
    canvas.translate(150, 250);
    canvas.rotate(value);
    canvas.translate(-100, -100);
    canvas.drawRect(r, p);

    canvas.restore();
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 25;
    p.color = Color.fromARGB(150, 64, 224, 208);
    r = Rect.fromLTWH(0, 0, 200, 200);
    canvas.translate(150, 250);
    canvas.rotate(value * -1);
    canvas.translate(-125, -125);
    canvas.drawRect(r, p);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}