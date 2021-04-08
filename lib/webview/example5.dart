import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebExampleFive extends StatefulWidget {
  @override
  WebExampleFiveState createState() => WebExampleFiveState();
}

class WebExampleFiveState extends State<WebExampleFive> {
  WebViewController? webViewController;

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
        initialUrl:
            'https://unsplash.com/photos/odxB5oIG_iA', // 'https://github.com/techwithsam',
        javascriptMode: JavascriptMode.unrestricted,
        allowsInlineMediaPlayback: true,
        debuggingEnabled: true,
        userAgent: "",
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      ),
    );
  }
}
