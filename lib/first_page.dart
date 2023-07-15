import 'package:f_test/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) :super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  final _controller = TextEditingController();
  final _fname = 'flutter_sampledata.txt';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('FILE DEMO')
        ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'FILE ACCESS!', 
              style: TextStyle(fontSize: 32, fontWeight: ui.FontWeight.w500),
            ),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Save',
            icon: Icon(
              Icons.save,
              color: Colors.white,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Load',
            icon: Icon(
              Icons.open_in_new,
              color: Colors.white,
            ),
          ),
        ],
        onTap: (int value) async {
          switch(value) {
            case 0:
              saveIt(_controller.text);
              setState(() {
                _controller.text = '';
              });
              showDialog(
                context: context, 
                builder: (BuildContext context) => AlertDialog(
                  title: Text('saved!'),
                  content: Text('save message to file.'),
                )
              );
              break;
            case 1:
              String value = await loadIt();
              setState(() {
                _controller.text = value;
              });
              showDialog(
                context: context, 
                builder: (BuildContext context) => AlertDialog(
                  title: Text('loaded!'),
                  content: Text('load message from file.'),
                )
              );
              break;
            default: print('no default.');
          }
        },
      ),
    );
  }
  Future<File> getDataFile(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return File(directory.path + '/' + filename);
  }
  void saveIt(String value) async {
    final file = await getDataFile(_fname);
    file.writeAsString(value);
  }
  Future<String> loadIt() async {
    try {
      final file = await getDataFile(_fname);
      return file.readAsString();
    } catch (e) {
      return '*** no data ***';
    }
  }
}
