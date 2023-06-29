import 'package:f_test/main.dart';
import 'package:flutter/material.dart';
import 'package:f_test/second_page.dart';

class FirstScreen extends StatefulWidget{
  const FirstScreen({Key? key}) :super(key: key);
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
  with SingleTickerProviderStateMixin{
    static const List<Tab> tabs = [
      Tab(text: 'One', icon: Icon(Icons.favorite)),
      Tab(text: 'Two', icon: Icon(Icons.music_note)),
      Tab(text: 'Three', icon: Icon(Icons.star)),
    ];

    late TabController _tabController;

    @override
    void initState(){
      super.initState();
      _tabController = TabController(
        length: tabs.length, 
        vsync: this,
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      bottomNavigationBar: Container(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((Tab tab){
          return createTab(tab);
        }).toList(),
      ),
    );
  }
  Widget createTab(Tab tab){
    return Center(
      child: Text(
        'This is ${tab.text} tab.',
        style: TextStyle(
          fontSize: 32,
          color: Colors.blue,
        ),
      ),
    );
  }
}