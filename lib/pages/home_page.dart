import 'package:flutter/material.dart';
import 'package:paint_ai/pages/tabs/gallery_tab.dart';

import 'tabs/appraise_tab.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ),
        elevation: 0.0,
      ),
      body: _currentIndex == 0 ? AppraiseTab() : _currentIndex == 1 ? GalleryTab() : Center(child: Text('Blue')),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red[50],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: Colors.red[200],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Appraise'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Text('Buy'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload),
            title: Text('Sell'),
          ),
        ],
      ),
    );
  }
}
