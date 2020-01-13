import 'package:video_player/video_player.dart';
//import 'package:flutter/material.dart';
import 'package:live_player_v2/player.dart';
//import 'package:rolling_nav_bar/rolling_nav_bar.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "TBN24",
//      theme: ThemeData(
//        primarySwatch: Colors.pink,
//      ),
//      home: MyHomePage(),
//    );
//  }
//}
//
//class MyHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text("TBN24")),
//      body: ListView(
//        children: <Widget>[
//          Player(
//            videoPlayerController: VideoPlayerController.network(
//                'https://www.radiantmediaplayer.com/media/bbb-360p.mp4'),
//          )
//        ],
//      ),
//    );
//  }
//}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:rolling_nav_bar/indexed.dart';
import 'package:rolling_nav_bar/rolling_nav_bar.dart';

void main() => runApp(MyApp());

double scaledHeight(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.height / 800);
}

double scaledWidth(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.width / 375);
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color logoColor;
  int activeIndex;

  var iconData = <IconData>[
    Icons.home,
    Icons.add_to_queue,
    Icons.live_tv,
    Icons.search,
    Icons.account_circle,
  ];

  var badges = <int>[null, null, null, null, null];

  var iconText = <Widget>[
    Text('Home', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Shows', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Live', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Search', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Account', style: TextStyle(color: Colors.grey, fontSize: 12)),
  ];

  var indicatorColors = <Color>[
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purple,
  ];

  List<Widget> get badgeWidgets => indexed(badges)
      .map((Indexed indexed) => indexed.value != null
      ? Text(indexed.value.toString(),
      style: TextStyle(
        color: indexed.index == activeIndex
            ? indicatorColors[indexed.index]
            : Colors.white,
      ))
      : null)
      .toList();

  @override
  void initState() {
    logoColor = Colors.red[600];
    activeIndex = 0;
    super.initState();
  }

  void incrementIndex() {
    setState(() {
      activeIndex = activeIndex < (iconData.length - 1) ? activeIndex + 1 : 0;
      print(activeIndex);
    });
  }

  // ignore: unused_element
  _onAnimate(AnimationUpdate update) {
    setState(() {
      logoColor = update.color;
    });
  }

  _onTap(int index) {
    activeIndex = index;
  }

  void _incrementBadge() {
    badges[activeIndex] =
    badges[activeIndex] == null ? 1 : badges[activeIndex] + 1;
    setState(() {});
  }

  List<Widget> get builderChildren => const <Widget>[
    Text('1', style: TextStyle(color: Colors.grey)),
    Text('2', style: TextStyle(color: Colors.grey)),
    Text('3', style: TextStyle(color: Colors.grey)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[100],
        primarySwatch: Colors.pink,
      ),
      home: Builder(
        builder: (BuildContext context) {
          double largeIconHeight = MediaQuery.of(context).size.width;
          double navBarHeight = scaledHeight(context, 85);
          double topOffset = (MediaQuery.of(context).size.height -
              largeIconHeight -
              MediaQuery.of(context).viewInsets.top -
              (navBarHeight * 2)) /
              2;
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: logoColor,
              child: Icon(Icons.add),
              onPressed: _incrementBadge,
            ),
            appBar: AppBar(
              title: Text('TBN24'),
            ),
            body: ListView(
              children: <Widget>[
                Player(
                  videoPlayerController: VideoPlayerController.network(
                      'https://www.radiantmediaplayer.com/media/bbb-360p.mp4'),
                )
              ],
            ),
            bottomNavigationBar: Container(
              // bottom: 0,
              height: navBarHeight,
              width: MediaQuery.of(context).size.width,
              // Option 1: Recommended
              child: RollingNavBar.iconData(
                activeBadgeColors: <Color>[
                  Colors.white,
                ],
                activeIndex: activeIndex,
                animationCurve: Curves.linear,
                animationType: AnimationType.roll,
                baseAnimationSpeed: 200,
                badges: badgeWidgets,
                iconData: iconData,
                iconColors: <Color>[Colors.grey[800]],
                iconText: iconText,
                indicatorColors: indicatorColors,
                iconSize: 25,
                indicatorRadius: scaledHeight(context, 30),
                onAnimate: _onAnimate,
                onTap: _onTap,
              ),

              // Option 2: Possibly more complicated, but there if you need it
              // child: RollingNavBar.builder(
              //   builder: (
              //     BuildContext context,
              //     int index,
              //     AnimationInfo info,
              //     AnimationUpdate update,
              //   ) {
              //     return builderChildren[index];
              //   },
              //   badges: badgeWidgets.sublist(0, builderChildren.length),
              //   indicatorColors:
              //       indicatorColors.sublist(0, builderChildren.length),
              //   numChildren: builderChildren.length,
              //   onTap: _onTap,
              // ),
            ),
          );
        },
      )

    );
  }
}


