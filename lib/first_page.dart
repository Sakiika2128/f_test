import 'package:f_test/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) :super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  final _controller = TextEditingController();
  final _fname = 'assets/documents/data.txt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FILE DEMO'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Resource access', style: TextStyle(fontSize: 32, fontWeight: ui.FontWeight.w500)),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: _controller,
              style: TextStyle(fontSize: 24),
              minLines: 1,
              maxLines: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_new),
        onPressed: () async {
          final value = await loadIt();
          setState(() {
            _controller.text = value;
          });
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('loaded!'),
              content: Text('load message from Assets.'),
            ),
          );
        },
      ),
    );
  }

  Future<String> getDataAssets(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<String> loadIt() async {
    try {
      final res = await getDataAssets(_fname);
      return res;
    } catch(e) {
      return '*** no data ***';
    }
  }
}
