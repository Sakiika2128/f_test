import 'package:f_test/main.dart';
import 'package:flutter/material.dart';
import 'package:f_test/second_page.dart';
import 'package:f_test/my_painter.dart';

class FirstScreen extends StatefulWidget{
  const FirstScreen({Key? key}) :super(key: key);
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'CANVAS DEMO',
          style: TextStyle(fontSize: 32, color: Colors.black),
        ),
      ),
      body: Container(
        child: CustomPaint(
          painter: MyPainter(),
        ),
      ),
    );
  }
}
