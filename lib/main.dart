import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('aaa'),
        ),
      body: Text(
        'flutter demo',
        style: TextStyle(fontSize: 16),
      ),
      ),
    );
  }
}
