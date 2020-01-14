import 'package:flutter/material.dart';
import 'package:live_player_v2/player.dart';
import 'package:video_player/video_player.dart';

class LivePage extends StatelessWidget {
  const LivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
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