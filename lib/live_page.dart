import 'package:flutter/material.dart';
import 'package:live_player_v2/player.dart';
import 'package:video_player/video_player.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Player(
            videoPlayerController: VideoPlayerController.network(
                'https://www.radiantmediaplayer.com/media/bbb-360p.mp4'),
          )
        ],
      ),
    );
  }
}
