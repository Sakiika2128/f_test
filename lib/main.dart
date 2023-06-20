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
  static var _selected = 'A';

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('FLUTTER DEMO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                _message,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Radio(
                  value: 'A',
                  groupValue: _selected,
                  onChanged: checkChanged,
                ),
                Text(
                  'Radio A',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Radio(
                  value: 'B',
                  groupValue: _selected,
                  onChanged: checkChanged,
                ),
                Text(
                  'Radio B',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void checkChanged(String? value){
    setState(() {
      _selected = value ?? 'no data';
      _message = 'select: $_selected';
    });
  }
}