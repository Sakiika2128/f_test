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
  static var _index = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text(
          _message,
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        backgroundColor: Colors.lightBlueAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Game',
            icon: Icon(Icons.sports_esports),
          ),
          BottomNavigationBarItem(
            label: 'Live',
            icon: Icon(Icons.live_tv),
          ),
          BottomNavigationBarItem(
            label: 'Music',
            icon: Icon(Icons.music_note),
          ),
        ],
        onTap: tapBottomIcon,
      ),
    );
  }
  void tapBottomIcon(int value){
    var items = ['Game', 'Live', 'Music'];
    setState(() => {
      _index = value,
      _message = 'You tapped "' + items[_index] + '".',
    });
  }
}