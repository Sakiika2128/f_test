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
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: buttonPressed,
              child: Text(
                'Tap here',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
 }
 void buttonPressed(){
  showDialog(
    context: context,
    builder: (BuildContext context) => SimpleDialog(
      title: const Text('which one do you choose?'),
      children: [
        SimpleDialogOption(
          onPressed: () => Navigator.pop<String>(context, '犬派'),
          child: Text('犬派'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop<String>(context, '猫派'),
          child: Text('猫派'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop<String>(context, '動物苦手'),
          child: Text('動物苦手'),
        ),
      ],
      ),
    ).then<void>((value) => resultAlert(value));
 }
 void resultAlert(String value){
  setState(() => {
    _message = 'selected: $value'
  });
 }
}