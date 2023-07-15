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
        child: Column(
          children: [
            AnimatedAlign(
              alignment: flg ? Alignment.topLeft : Alignment.topRight, 
              duration: const Duration(seconds: 1),
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
              curve: Curves.linear,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: AnimatedAlign(
                alignment: flg ? Alignment.topRight : Alignment.topLeft, 
                duration: const Duration(seconds: 3),
                child: Container(
                  color: Colors.blue,
                  height: 180,
                  width: 150,
                ),
              ),
            )
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
