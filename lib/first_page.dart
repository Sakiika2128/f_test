import 'dart:math';
import 'dart:convert';
import 'dart:io';
import 'package:f_test/main.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) :super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  final _controller = TextEditingController();
  static const host = 'baconipsum.com';
  static const path = '/api/?type=meat-and-filler&paras=1&format=text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('INTERNET ACCESS', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: _controller,
              style: TextStyle(fontSize: 24),
              minLines: 1,
              maxLines: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_new),
        onPressed: () {
          getData();
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('loaded!'),
              content: Text('get contents from URI.'),
            ),
          );
        },
      ),
    );
  }

  void getData() async {
    var http = await HttpClient();
    HttpClientRequest request = await http.get(host, 80, path);
    HttpClientResponse response = await request.close();
    final value = await response.transform(utf8.decoder).join();
    _controller.text = value;
  }
}
