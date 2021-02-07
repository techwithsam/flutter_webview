import 'package:flutter/material.dart';
import 'webview/example1.dart';
import 'webview/example2.dart';
import 'webview/example3.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WebExampleThree inAppBrowser = WebExampleThree();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Webview Tutorial'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => WebExampleOne()));
                },
                child: Text(
                  'Example 1',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.yellow[900],
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
              ),
              SizedBox(height: 12),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => WebExampleTwo()));
                },
                child: Text(
                  'Example 2',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
              ),
              SizedBox(height: 12),
              MaterialButton(
                onPressed: () {
                  inAppBrowser.openUrl(url: 'https://obounce.net');
                },
                child: Text(
                  'Example 3',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple[700],
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
              ),
              SizedBox(height: 12),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  'Example 4',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.pink[900],
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
