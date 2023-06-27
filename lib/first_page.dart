import 'package:f_test/main.dart';
import 'package:flutter/material.dart';
import 'package:f_test/second_page.dart';

class FirstScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('books'),
      ),
      body: Center(
        child: Container(
          child: const Text(
            'This is books Screen.',
            style: TextStyle(fontSize: 32),
          ),
        ),
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
                builder: (context) => SecondScreen(),
              )
            );
        },
      ),
    );
  }
}