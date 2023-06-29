import 'package:f_test/main.dart';
import 'package:flutter/material.dart';
import 'package:f_test/second_page.dart';

class FirstScreen extends StatefulWidget{
  const FirstScreen({Key? key}) :super(key: key);
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>{
  static var _items = <Widget>[];
  static var _message = 'OK';
  static var _tapped = 0;

  @override
  void initState() {
    super.initState();
    for(var i = 0; i < 5; i++){
      var item = ListTile(
        leading: Icon(Icons.auto_awesome),
        title: Text('No. $i'),
        onTap: () {
          _tapped = i;
          tapItem();
        },
      );
      _items.add(item);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLUTTER APP'),
      ),
      body: Center(
        child: Text(
          _message,
          style: TextStyle(fontSize: 32),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20),
          children: _items,
        ),
      ),
    );
  }
  void tapItem(){
    Navigator.pop(context);
    setState(() {
      _message = 'you tapped No.$_tapped';
    });
  }
}