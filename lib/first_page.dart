import 'package:f_test/main.dart';
import 'package:flutter/material.dart';
import 'package:f_test/second_page.dart';
import 'package:f_test/my_painter.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:math';

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) :super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
  with SingleTickerProviderStateMixin{
    late Animation<double> animation;
    late AnimationController controller;

    @override
    void initState(){
      super.initState();
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 5),
      );
      animation = Tween<double>(begin: 0, end: pi * 2)
        .animate(controller)
        ..addListener(() {
          setState(() {
          });
        });
        controller.repeat(reverse: true);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Graphic Demo', style: TextStyle(fontSize: 32)),
        ),
        body: Center(
          child: Column(
            children: [
              Padding( padding: EdgeInsets.all(10)),
              Container(
                width: 300,
                height: 300,
                child: CustomPaint(
                  painter: MyPainter(animation.value),
                  child: Center(),
                ),
              ),
            ],
          ),
        ),
      );
    }
}
