import 'package:f_test/main.dart';
import 'package:flutter/material.dart';
import 'package:f_test/second_page.dart';

class FirstScreen extends StatefulWidget{
  FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>{
  static final _controller = TextEditingController();
  static var _input = '';

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('FLUTTER DEMO'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: const Text(
              'write something.',
              style: TextStyle(fontSize: 32),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _controller,
              style: TextStyle(fontSize: 28),
              onChanged: changeField,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Books',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.navigate_next),
            label: 'next',
          ),
        ],
        onTap: (int value) {
          if(value == 1)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(_input)
              ),
            );
        },
      ),
    );
  }
  void changeField(String val) => _input = val;
}