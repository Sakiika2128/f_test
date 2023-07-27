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
  static const url = 'https://jsonplaceholder.typicode.com/posts';

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
              maxLines: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_new),
        onPressed: () {
          setData();
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

  void setData() async {
    final ob = {
      "title": "あああ",
      "author": "SYODA-Tuyano",
      "content": "this is content.これはサンプルコンテンツです"
    };
    final jsondata = json.encode(ob);
    var https = await HttpClient();
    HttpClientRequest request = await https.postUrl(Uri.parse(url));
    request.headers.set(HttpHeaders.contentTypeHeader,
      "application/json; charset=UTF-8");
    request.write(jsondata);
    HttpClientResponse response = await request.close();
    final value = await response.transform(utf8.decoder).join();
    _controller.text = value;
  }
}
