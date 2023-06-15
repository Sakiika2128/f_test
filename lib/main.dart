import 'package:flutter/material.dart';
import 'package:f_test/Data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = 'テキスト';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLUTTER DEMO',
      home: MyHomePage(
        title: this.title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget{
  final String title;
  const MyHomePage({
    Key? key,
    required this.title,
  }): super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  static final _data = [
    Data('Apple', 200),
    Data('Orange', 150),
    Data('Peach', 300),
  ];
  Data _item = _data[0];
 
  void _setData(){
    setState(() {
      _data.shuffle();
      _item = _data.first;
      // _item = (_data..shuffle()).first;
    });
  }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SET DATA'),
      ),
      body: Text(
        _item.toString(),
        style: TextStyle(fontSize: 24),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setData,
        tooltip: 'set some item',
        child: Icon(Icons.star),
      ),
    );
  }
}

