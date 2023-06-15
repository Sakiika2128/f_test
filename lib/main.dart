import 'package:flutter/material.dart';

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
  String _message = 'Hello!';

  void _setMessage(){
    setState(() => 
      _message = "ボタンが押されました",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        _message,
        style: TextStyle(fontSize: 16),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setMessage,
        tooltip: 'push the button',
        child: Icon(Icons.star),
      ),
    );
  }
}

