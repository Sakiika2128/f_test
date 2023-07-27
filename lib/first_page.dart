import 'dart:math';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_test/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) :super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  final _controller = TextEditingController();
  // static const url = 'https://jsonplaceholder.typicode.com/posts';

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
          fire();
        },
      ),
    );
  }

  void fire() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('mydata').get();
    var msg = '';
    snapshot.docChanges.forEach((element) {
      final animal = element.doc.get('animal');
      final character = element.doc.get('character');
      final old = element.doc.get('old');
      msg += "${animal} (${old}) 性格：${character}\n";
    });
    _controller.text = msg;
  }
}
