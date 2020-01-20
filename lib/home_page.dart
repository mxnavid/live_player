import 'package:flutter/material.dart';
import 'account.dart';
import 'live_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [LivePage(), Account(), LivePage()];
  int _selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('TV Channel Player'),
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text('Home')),
          BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle), title: new Text('Account')),
          BottomNavigationBarItem(
              icon: new Icon(Icons.video_call), title: new Text('Video'))
        ],
      ),
    );
  }
}
