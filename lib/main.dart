// Developer: Samuel Adekunle
// YouTube Tutorial: https://youtube.com/playlist?list=PLMfrNHAjWCoB6roLO1soz6RMc5BdnU9pk
// Join My Discord Server to ask question: https://discord.com/invite/NytgTkyw3R
// Follow me on Twitter: https://twitter.com/techwithsam_

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  await FlutterDownloader.initialize(
      debug: false); // set true to enable printing logs to console
  await Permission.storage
      .request(); // ask for storage permission on app create

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechWithSam - Flutter Webview Tutorial',
      theme: ThemeData(
          primarySwatch: Colors.blue, visualDensity: VisualDensity.standard),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
