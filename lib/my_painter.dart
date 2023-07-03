import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter{
  ui.Image? _img = null;
  MyPainter(this._img);

  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();
    final _img = this._img;

    if(_img != null){
      Rect r0 = Rect.fromLTWH(0.0, 0.0, _img.width.toDouble(), _img.height.toDouble());
      Rect r = Rect.fromLTWH(50.0, 50.0, 300.0, 200.0);
      canvas.drawImageRect(_img, r0, r, p);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}