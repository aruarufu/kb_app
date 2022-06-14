import 'package:flutter/material.dart';
// Delete the package:webview_flutter/webview_flutter.dart import
import 'package:kb_app/view/web_view_stack.dart'; // Add this import

class WebViewSAW extends StatefulWidget {
  @override
  State<WebViewSAW> createState() => _WebViewSAWState();
}

class _WebViewSAWState extends State<WebViewSAW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Additive Weighting'),
      ),
      body: WebViewStack(), // Replace the WebView widget with WebViewStack
    );
  }
}
