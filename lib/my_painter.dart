import 'dart:math';

import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter{
  final ValueNotifier<int> _value;

  MyPainter(this._value);

  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();
    p.color = Color.fromARGB(140, 127, 255, 212);
    p.style = PaintingStyle.fill;
    
    Rect r;
    for(var i = 0; i < _value.value; i++){
      r = Rect.fromLTWH(
        10 + i * 20, 
        10 + i * 20, 
        100, 
        100
      );
      canvas.drawRect(r, p);
    }
    r = Rect.fromLTWH(0, 0, size.width, size.height);
    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(255, 100, 100, 100);
    canvas.drawRect(r, p);
    if(_value.value > 10){
      _value.value = 0;
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}