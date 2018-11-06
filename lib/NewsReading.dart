import 'package:flutter/material.dart';
import 'package:news_app/News.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsReading extends StatefulWidget {
  
  final Articles arts;
  
  NewsReading({this.arts});

  @override
  NewsReadingState createState() {
    return new NewsReadingState();
  }
}

class NewsReadingState extends State<NewsReading> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(title: Text(widget.arts.title),backgroundColor: Colors.blue,),
      url: widget.arts.url,

    );
  }
}

