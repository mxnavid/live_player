import 'package:flutter/material.dart';
import 'package:live_player_v2/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TBN24',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
    );
  }
}
