import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebExampleFour extends ChromeSafariBrowser {
  WebExampleFour(browserFallback) : super(bFallback: browserFallback);

  @override
  void onOpened() {}

  @override
  void onCompletedInitialLoad() {}

  @override
  void onClosed() {}
}
