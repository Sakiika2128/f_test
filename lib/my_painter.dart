import 'dart:math';

import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter{
  final double _value;
  final int _opaq;

  MyPainter(this._value, this._opaq);

  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(_opaq, 255, 69, 0);
    Rect r = Rect.fromLTWH(
      (size.width - _value) / 2, 
      (size.height - _value) / 2,
      _value, 
      _value
    );
    canvas.drawOval(r, p);

    r = Rect.fromLTWH(0, 0, size.width, size.height);
    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(255, 100, 100, 100);
    canvas.drawRect(r, p);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}