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
      Tab(text: 'One'),
      Tab(text: 'Two'),
      Tab(text: 'Three'),
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
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((Tab tab){
          return createTab(tab);
        }).toList(),
      ),
      bottomNavigationBar: TabBar(
          controller: _tabController,
          tabs: tabs,
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