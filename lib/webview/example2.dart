import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebExampleTwo extends StatefulWidget {
  WebExampleTwo({Key key}) : super(key: key);

  @override
  _WebExampleTwoState createState() => _WebExampleTwoState();
}

class _WebExampleTwoState extends State<WebExampleTwo> {
  InAppWebViewController _webViewController;
  double progress = 0;
  String urls = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("O'Bounce Technologies"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              if (_webViewController != null) {
                _webViewController.reload();
              }
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            progress < 1.0
                ? LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.green[800]),
                  )
                : Center(),
            Expanded(
              child: InAppWebView(
                initialUrl: 'https://obounce.net',
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    javaScriptEnabled: true,
                    javaScriptCanOpenWindowsAutomatically: true,
                  ),
                ),
                onProgressChanged: (_, load) {
                  setState(() {
                    progress = load / 100;
                  });
                },
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
                onLoadStart: (_, url) {
                  setState(() {
                    urls = url;
                  });
                  print('***** $urls *****');
                },
                onLoadStop: (_, url) {
                  setState(() {
                    urls = url;
                  });
                  print('*****0000 $urls 0000*****');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
