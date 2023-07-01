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
    ..addText('👨‍🦱←出会い厨')
    ..pushStyle(ui.TextStyle(
      color: Colors.blue,
      fontSize: 32
    ))
    ..addText('どしたん？話聞こか？')
    ..pushStyle(ui.TextStyle(
      color: Colors.green,
      fontSize: 16,
    ))
    ..addText('LINEやってる？てかどこ住み？');
    
    ui.Paragraph paragraph = builder.build()
    ..layout(ui.ParagraphConstraints(width: 300));

    Offset offset = Offset(50.0, 50.0);
    canvas.drawParagraph(paragraph, offset);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}