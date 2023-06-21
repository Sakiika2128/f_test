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
 static var _selected = 'One';

 @override
 Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('DropdownButton DEMO'),
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
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          DropdownButton<String>(
            onChanged: popupSelected,
            value: _selected,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
            items: <DropdownMenuItem<String>>[
              const DropdownMenuItem<String>(
                value: 'One',
                child: const Text('One'),
              ),
              const DropdownMenuItem<String>(
                value: 'Two',
                child: const Text('Two'),
              ),
              const DropdownMenuItem<String>(
                value: 'Three',
                child: const Text('Three'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
 }
 void popupSelected(String? value){
  setState(() {
    _selected = value ?? 'not selected...';
    _message = 'Select: $_selected';
  });
 }
}