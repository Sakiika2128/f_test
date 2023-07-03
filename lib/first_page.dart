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
  static ui.Image? _img = null;
  static bool _flg = false;

  Future<void> loadAssetImage(String fname) async {
    final bd = await rootBundle.load('assets/images/$fname');
    final Uint8List u8lst = await Uint8List.view(bd.buffer);
    final codec = await ui.instantiateImageCodec(u8lst);
    final frameInfo = await codec.getNextFrame();
    _img = frameInfo.image;
    setState(() => _flg = true);
  }

  @override
  Widget build(BuildContext context) {
    loadAssetImage('cat.jpg');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'IMAGE DEMO',
          style: TextStyle(fontSize: 32)
        ),
      ),
      body: Container(
        child: CustomPaint(
          painter: MyPainter(_img),
        ),
      ),
    );
  }
}
