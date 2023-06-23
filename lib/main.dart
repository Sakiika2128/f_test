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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('スクロール可能なリスト'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.blue,
              height: 200,
              child: const Center(
                child: const Text(
                  'Games',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
            Container(
              color: Colors.amber,
              height: 200,
              child: const Center(
                child: const Text(
                  'Live',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              height: 200,
              child: const Center(
                child: Text(
                  'Musics',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
            Container(
              color: Colors.pink,
              height: 200,
              child: const Center(
                child: Text(
                  'SNS',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
            Container(
              color: Colors.orange,
              height: 200,
              child: const Center(
                child: Text(
                  'Beauty',
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}