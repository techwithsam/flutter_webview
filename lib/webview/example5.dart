import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebExampleFive extends StatefulWidget {
  @override
  WebExampleFiveState createState() => WebExampleFiveState();
}

class WebExampleFiveState extends State<WebExampleFive> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: 'https://github.com/techwithsam',
        javascriptMode: JavascriptMode.unrestricted,
        allowsInlineMediaPlayback: true,
        initialMediaPlaybackPolicy:
            AutoMediaPlaybackPolicy.require_user_action_for_all_media_types,
      ),
    );
  }
}
