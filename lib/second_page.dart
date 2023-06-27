import 'package:flutter/material.dart';
import 'package:f_test/main.dart';
import 'package:f_test/first_page.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Next'),
      ),
      body: Center(
        child: Text(
          'Next Screen',
          style: TextStyle(fontSize: 32),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.navigate_before, size: 32),
            label: 'prev',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Musics',
          ),
        ],
        onTap: (int value) {
          if(value == 0)
            Navigator.pop(context);
        },
      ),
    );
  }
}