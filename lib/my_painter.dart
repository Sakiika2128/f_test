import 'dart:math';

import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter{
  final List<Offset> _points;
  MyPainter(this._points);

  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 255, 69, 0);
    for(var pos in _points){
      Rect r = Rect.fromLTWH(pos.dx - 25, pos.dy - 25, 50.0, 50.0);
      canvas.drawOval(r, p);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}