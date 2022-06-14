import 'package:flutter/material.dart';
// Delete the package:webview_flutter/webview_flutter.dart import
import 'package:kb_app/view/webview_dokum.dart'; // Add this import

class Dokum extends StatefulWidget {
  @override
  State<Dokum> createState() => _DokumState();
}

class _DokumState extends State<Dokum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dokumentasi'),
      ),
      body: WebViewDokum(), // Replace the WebView widget with WebViewStack
    );
  }
}
