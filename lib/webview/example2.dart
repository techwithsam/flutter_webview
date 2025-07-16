import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';

class WebExampleTwo extends StatefulWidget {
  final String url;
  WebExampleTwo({Key? key, required this.url}) : super(key: key);

  @override
  _WebExampleTwoState createState() => _WebExampleTwoState();
}

class _WebExampleTwoState extends State<WebExampleTwo> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? _webViewController;
  late PullToRefreshController pullToRefreshController;
  final urlController = TextEditingController();
  double progress = 0;
  String url = '';

  var options = InAppWebViewSettings(
    javaScriptEnabled: true,
    cacheEnabled: true,
    transparentBackground: true,
  );

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(color: Colors.blue),
      onRefresh: () async {
        if (Platform.isAndroid) {
          _webViewController?.reload();
        } else if (Platform.isIOS) {
          _webViewController?.loadUrl(
              urlRequest: URLRequest(url: await _webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Tect With Sam"),
      //   centerTitle: true,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       onPressed: () => _webViewController?.reload(),
      //       icon: Icon(Icons.refresh),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    initialUrlRequest: URLRequest(
                      url: WebUri('https://resizeimage.net/'),
                      headers: {},
                    ), // "https://unsplash.com/photos/odxB5oIG_iA"
                    initialSettings: options,
                    pullToRefreshController: pullToRefreshController,
                    onDownloadStartRequest: (controller, url) async {
                      // downloading a file in a webview application
                      print("onDownloadStart $url");
                      await FlutterDownloader.enqueue(
                        url: url.toString(), // url to download
                        savedDir: (await getExternalStorageDirectory())!.path,
                        // the directory to store the download
                        fileName: 'downloads',
                        headers: {},
                        showNotification: true,
                        openFileFromNotification: true,
                      );
                    },
                    onWebViewCreated: (controller) {
                      _webViewController = controller;
                    },
                    onLoadStart: (controller, url) {
                      setState(() {
                        this.url = url.toString();
                        urlController.text = this.url;
                      });
                    },
                    onPermissionRequest: (controller, resources) async {
                      return PermissionResponse(
                        resources: [],
                        action: PermissionResponseAction.GRANT,
                      );
                    },
                    onLoadStop: (controller, url) async {
                      pullToRefreshController.endRefreshing();
                      setState(() {
                        this.url = url.toString();
                        urlController.text = this.url;
                      });
                    },
                    onReceivedError: (controller, url, code) {
                      pullToRefreshController.endRefreshing();
                    },
                    onProgressChanged: (controller, progress) {
                      if (progress == 100) {
                        pullToRefreshController.endRefreshing();
                      }
                      setState(() {
                        this.progress = progress / 100;
                        urlController.text = this.url;
                      });
                    },
                    onUpdateVisitedHistory: (controller, url, androidIsReload) {
                      setState(() {
                        this.url = url.toString();
                        urlController.text = this.url;
                      });
                    },
                    onConsoleMessage: (controller, consoleMessage) {
                      print(consoleMessage);
                    },
                  ),
                  progress < 1.0
                      ? LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green[800]!),
                        )
                      : Center(),
                ],
              ),
            ),
            OverflowBar(
              // buttonAlignedDropdown: true,
              // buttonPadding: EdgeInsets.all(2),
              overflowSpacing: 2, spacing: 2,
              alignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    _webViewController?.goBack();
                  },
                ),
                ElevatedButton(
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    _webViewController?.goForward();
                  },
                ),
                ElevatedButton(
                  child: Icon(Icons.refresh),
                  onPressed: () {
                    _webViewController?.reload();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
