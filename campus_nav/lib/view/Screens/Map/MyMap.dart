//Flutter widgets
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';

class MyMap extends StatelessWidget {
  final String title = 'Campus NAV';
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
      
  MyMap({
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WebView(
          initialUrl: 'https://maps.mapwize.io/#/v/venue_feup?k=7df55016372497ab&u=ESOF&l=pt&z=15&embed=true',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}
