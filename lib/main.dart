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
  static var _stars = '☆☆☆☆☆';
  static var _star = 0;

  @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('タイトル'),
      leading: BackButton(
        color: Colors.white,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.sunny),
          tooltip: 'add brightness',
          onPressed: iconPressedAdd,
        ),
        IconButton(
          icon: Icon(Icons.bedtime),
          tooltip: 'get dark',
          onPressed: iconPressedRemove,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: Center(
          child: Text(
            _stars,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
    body: Center(
      child: Text(
        _message,
        style: TextStyle(fontSize: 28),
      ),
    ),
  );
  }
  void iconPressedAdd(){
    _message = 'tap Sunny';
    _star++;
    update();
  }
  void iconPressedRemove(){
    _message = 'tap Moon';
    _star--;
    update();
  }
  void update(){
    _star = _star < 0 ? 0 : _star > 5 ? 5 : _star;
    setState(() {
      _stars = '★★★★★☆☆☆☆☆'.substring(
        5 - _star,
        5 - _star + 5
      );
    });
  }
}