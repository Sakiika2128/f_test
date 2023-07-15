import 'package:f_test/main.dart';
import 'package:flutter/foundation.dart';
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

class _MyHomePageState extends State<MyHomePage>{
  bool flg = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo', style: TextStyle(fontSize: 28)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              top: flg ? 300 : 0,
              left: flg ? 0 : 300,
              child: Container(
                color: Colors.pink,
                width: 100,
                height: 100,
              ), 
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flg = !flg;
          });
        },
        child: const Icon(Icons.music_note),
      ),
    );
  }
}
