import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:live_player_v2/player.dart';
import 'package:rolling_nav_bar/rolling_nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TBN24",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TBN24")),
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
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: MyVideoScreen(),
//       ),
//     );
//   }
// }

// class MyVideoScreen extends StatefulWidget {
//   @override
//   _MyVideoScreenState createState() => _MyVideoScreenState();
// }

// class _MyVideoScreenState extends State<MyVideoScreen> {
//   MediaPlayer player;
//   MediaFile song1 = MediaFile(
//     title: "Song 1",
//     type: "video",
//     source: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
//     desc: "Note from Apple",
//   );

//   @override
//   void initState() {
//     // first argument for isBackground next for showNotification.
//     player = MediaPlayerPlugin.create(isBackground: true, showNotification: true);
//     initVideo();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     player.dispose();
//     super.dispose();
//   }

//   void initVideo() async {
//     await player.initialize();
//     await player.setSource(song1);
//     player.play();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       VideoPlayerView(player),
// //      VideoProgressIndicator(
// //        player,
// //        allowScrubbing: true,
// //        padding: EdgeInsets.symmetric(vertical:5.0),
// //      ),
//       SizedBox(height:20.0),
//       buildButtons()
//     ]);
//   }

//   Row buildButtons() {
//     return Row(
//       children: <Widget>[
//         FlatButton(
//           child: Text("Prev"),
//           onPressed: () {
//             player.playPrev();
//           },
//         ),
//         FlatButton(
//           child: Text("Play"),
//           onPressed: () {
//             player.play();
//           },
//         ),
//         FlatButton(
//           child: Text("Pause"),
//           onPressed: () {
//             player.pause();
//           },
//         ),
//         FlatButton(
//           child: Text("Next"),
//           onPressed: () {
//             player.playNext();
//           },
//         ),
//       ],
//     );
//   }
// }
