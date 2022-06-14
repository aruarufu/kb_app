import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDokum extends StatefulWidget {
  @override
  State<WebViewDokum> createState() => _WebViewDokum();
}

class _WebViewDokum extends State<WebViewDokum> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          //initialUrl: 'https://kapalbajaspk.000webhostapp.com/spkanggota/',
          initialUrl:
              'https://drive.google.com/drive/folders/17ZhpPvkxMSDma8db138m3BVe_niTAFIe?usp=sharing',
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
    );
  }
}
