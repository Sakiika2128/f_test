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
  static ValueNotifier<int> _value = ValueNotifier<int>(0);

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Graphic demo',
          style: TextStyle(fontSize: 32),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Container(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: MyPainter(_value),
                child: Center(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ElevatedButton(
              child: Text('CLICK!', style: TextStyle(fontSize: 30)),
              onPressed: () => _value.value++,
            ),
          ],
        ),
      ),
    );
  }
}
