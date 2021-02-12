import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:full_webview/check_internet.dart';
import 'package:full_webview/webview/example4.dart';
import 'webview/example1.dart';
import 'webview/example2.dart';
import 'webview/example3.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final WebExampleThree inAppBrowser = WebExampleThree();
  final WebExampleFour inAppChrome = WebExampleFour(WebExampleThree());

  int checkInt = 0;

  @override
  void initState() {
    super.initState();
    Future<int> a = CheckInternet().checkInternetConnection();
    a.then((value) {
      if (value == 0) {
        setState(() {
          checkInt = 0;
        });
        print('No internet connect');
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('No internet connection!'),
        ));
      } else {
        setState(() {
          checkInt = 1;
        });
        print('Internet connected');
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Connected to the internet'),
        ));
      }
    });
    inAppChrome.addMenuItem(ChromeSafariBrowserMenuItem(
      id: 1,
      label: 'Example 1',
      action: (title, url) {
        print(title);
        print(url);
      },
    ));
    inAppChrome.addMenuItem(ChromeSafariBrowserMenuItem(
      id: 2,
      label: 'Example 2',
      action: (title, url) {
        print(title);
        print(url);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                onPressed: () {
                  checkInt == 1       
                      ? inAppChrome.open(
                          url: 'https://obounce.net',
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(),
                              ios: IOSSafariOptions()))
                      : _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('No internet connection!'),
                        ));
                },
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
