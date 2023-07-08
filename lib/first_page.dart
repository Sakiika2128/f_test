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
  static double _value = 0;
  static double _opaq = 0;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'GRAPHIC DEMO',
          style: TextStyle(fontSize: 32),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Container(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: MyPainter(_value, _opaq.toInt()),
              child: Center(),
            ),
          ),
          Slider(
            min: 0.0,
            max: 300.0,
            value: _value,
            onChanged: _changeVal,
          ),
          Slider(
            min: 0.0,
            max: 255.0,
            value: _opaq,
            onChanged: _changeOpaq,
          ),
        ],
      ),
    );
  }

  void _changeVal(double value){
    setState(() {
      _value = value;
    });
  }
  void _changeOpaq(double value){
    setState(() {
      _opaq = value;
    });
  }
}
