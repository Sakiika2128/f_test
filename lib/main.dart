import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var _message = 'OK';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
      ),
      body: Column(
        children: [
          Text(
            _message,
            style: TextStyle(fontSize: 32),
          ),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            children: [
              Text('犬派', style: TextStyle( fontSize: 24)),
              Text('猫派', style: TextStyle(fontSize: 24)),
              Text('うさぎ派', style: TextStyle(fontSize: 24)),
            ],
          ),
        ],
      ),
    );
  }
}