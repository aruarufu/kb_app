import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class Dokum extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Dokum> {
  Future<void> openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(
        url:
            "https://drive.google.com/drive/folders/17ZhpPvkxMSDma8db138m3BVe_niTAFIe?usp=sharing");
  }

  List<BrowserEvent> _events = [];

  StreamSubscription<BrowserEvent> _browserEvents;

  @override
  void initState() {
    super.initState();

    _browserEvents = FlutterWebBrowser.events().listen((event) {
      setState(() {
        _events.add(event);
      });
    });
  }

  @override
  void dispose() {
    _browserEvents?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Dokumentasi Kegiatan'),
        ),
        body: new Center(
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              RaisedButton(
                onPressed: () => openBrowserTab(),
                child: new Text('Buka Arsip'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
