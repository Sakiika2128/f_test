import 'package:flutter/material.dart';

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
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter demo'),
      ),
      body: Container(
        color: Colors.greenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'サンプルテキスト',
              style: TextStyle(
                fontSize: 36,
                backgroundColor: Colors.orangeAccent,
              ),
            ),
            Text(
              'ねこ様🐱',
              style: TextStyle(
                fontSize: 36,
                backgroundColor: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
   }
}