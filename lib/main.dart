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
  String _message = 'OK';
  List<String> _janken = ['👊', '🤞', '🖐'];

  void buttonPressed() {
    setState(() {
      _message = (_janken..shuffle()).first;
    });
  }

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
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.flutter_dash),
              iconSize: 150,
              color: Colors.pinkAccent,
              onPressed: buttonPressed,
            ),
            // RawMaterialButton(
            //   onPressed: buttonPressed,
            //   fillColor: Colors.lightBlue,
            //   elevation: 10,
            //   padding: EdgeInsets.all(10),
            //   child: Text(
            //     'PUSH ME!',
            //     style: TextStyle(
            //       fontFamily: 'Roboto',
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            //   ElevatedButton(
            //     onPressed: buttonPressed,
            //     child: Padding(
            //       padding: EdgeInsets.all(10),
            //       child: Text(
            //         'PUSH',
            //         style: TextStyle(
            //           fontSize: 32,
            //           fontWeight: FontWeight.bold,
            //           fontFamily: 'Roboto',
            //         ),
            //       ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}