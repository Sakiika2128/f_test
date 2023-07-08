import 'package:f_test/main.dart';
import 'package:flutter/material.dart';
import 'package:f_test/second_page.dart';
import 'package:f_test/my_painter.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) :super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  static List<Offset>_points = [];

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GRAPHIC DEMO',
          style: TextStyle(fontSize: 32),
        ),
      ),
      body: Center(
        child: Listener(
          onPointerDown: _addPointer,
          child: CustomPaint(
            painter: MyPainter(_points),
            child: Center(),
          ),
        ),
      ),
    );
  }
  void _addPointer(PointerDownEvent event){
    setState(() {
      _points.add(event.localPosition);
    });
  }
}
