import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebExampleOne extends StatefulWidget {
  WebExampleOne({Key key}) : super(key: key);

  @override
  _WebExampleOneState createState() => _WebExampleOneState();
}

class _WebExampleOneState extends State<WebExampleOne> {
  final _flutterwebview = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://obounce.net',
      appBar: AppBar(
        title: Text("O'Bounce Technologies"),
        centerTitle: true,
        elevation: 0,
      ),
      withZoom: true,
      withLocalStorage: true,
      scrollBar: true,
      withJavascript: true,
      initialChild: Center(child: Text('Loading...')),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: Text('This is the bottomNavigationBar on a webview page.'),
      ),
      persistentFooterButtons: [
        CircleAvatar(
          backgroundColor: Colors.purple,
          child: Text('btn1'),
        ),
        CircleAvatar(
          backgroundColor: Colors.orange,
          child: Text('btn2'),
        ),
        CircleAvatar(
          backgroundColor: Colors.red,
          child: Text('btn3'),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey[700],
          child: Text('btn4'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _flutterwebview.dispose();
    super.dispose();
  }
}
