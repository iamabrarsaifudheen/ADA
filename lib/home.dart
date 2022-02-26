import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var loadingPercentage = 0;

  // @override
  // void initState() {
  //   if (Platform.isAndroid) {
  //     WebView.platform = SurfaceAndroidWebView();
  //   }
  //   super.initState();
  // }
 @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
        body: Stack(
      children: [
        WebView(
          initialUrl: 'https://ada-makeaton.web.app/',
          javascriptMode: JavascriptMode.unrestricted,
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    ));
  }
}
