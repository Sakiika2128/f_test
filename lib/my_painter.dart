import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter{
  ui.Image? _img = null;
  MyPainter(this._img);

  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();

    Offset off = Offset(50.0, 50.0);
    if(_img != null){
      canvas.drawImage(_img!, off, p);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}