import 'package:flutter/material.dart';
import 'package:f_test/first_page.dart';
import 'dart:ui' as ui;

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();

    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textDirection: TextDirection.ltr)
    )
    ..pushStyle(ui.TextStyle(
      color: Colors.red,
      fontSize: 48,
    ))
    ..addText('あか')
    ..pushStyle(ui.TextStyle(
      color: Colors.blue,
      fontSize: 32
    ))
    ..addText('あお')
    ..pushStyle(ui.TextStyle(
      color: Colors.yellow,
      fontSize: 16,
    ))
    ..addText('きいろ');
    
    ui.Paragraph paragraph = builder.build()
    ..layout(ui.ParagraphConstraints(width: 600));

  Offset offset = Offset(50.0, 50.0);
  canvas.drawParagraph(paragraph, offset);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}