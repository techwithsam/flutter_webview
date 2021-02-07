import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebExampleThree extends InAppBrowser {
  @override
  Future onBrowserCreated() async {}

  @override
  Future onLoadStart(url) async {}

  @override
  Future onLoadStop(url) async {}

  @override
  void onLoadError(url, code, msg) {}

  @override
  void onProgressChanged(progress) {}

  @override
  void onExit() {}

  @override
  Future<ShouldOverrideUrlLoadingAction> shouldOverrideUrlLoading(
      ShouldOverrideUrlLoadingRequest shouldOverrideUrlLoadingRequest) async {
    return ShouldOverrideUrlLoadingAction.ALLOW;
  }

  @override 
  void onLoadResource(response) {}

  @override 
  void onConsoleMessage(msg) {}
}
