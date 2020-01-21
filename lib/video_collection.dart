import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class playListWebView extends StatefulWidget {
  @override
  _playListWebViewState createState() => _playListWebViewState();
}

class _playListWebViewState extends State<playListWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
      initialUrl: "https://www.youtube.com/user/marquesbrownlee/playlists",
      javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}
