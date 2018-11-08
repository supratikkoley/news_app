import 'package:flutter/material.dart';
import 'package:news_app/NewsPage.dart';

void main() => runApp(
     new NewsApp(),
  );



class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => new _NewsAppState();
}

class _NewsAppState extends State<NewsApp> with SingleTickerProviderStateMixin {
  TabController _tabcontrol;

  String techUrl  =
      "https://newsapi.org/v2/top-headlines?country=in&query=technology&category=technology&pageSize=100&apiKey=f10ff2dc6015435488deae959371f83a";
  String businessUrl =
      "https://newsapi.org/v2/top-headlines?country=in&query=business&category=business&pageSize=100&apiKey= api-key";
  String entertainmentUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&pageSize=100&apiKey=api-key";
  String IndiaUrl =
      "https://newsapi.org/v2/top-headlines?country=in&query=india&category=general&pageSize=100&apiKey=api-key";
  String worldUrl =
      "https://newsapi.org/v2/top-headlines?country=us&country=in&query=world&pageSize=100&apiKey=api-key";
  String scienceUrl =
      "https://newsapi.org/v2/top-headlines?country=in&query=science&category=science&pageSize=100&apiKey=api-key";
  String sportsUrl =
      "https://newsapi.org/v2/top-headlines?country=in&query=sports&category=sports&apiKey=api-key";

  @override
  void initState() {
     super.initState();
    _tabcontrol = new TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
        home: new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          // ignore: argument_type_not_assignable
          IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed:(){
            
          }
          )
        ],
        elevation: 5.0,
        title: Text("News App"),
        bottom: new TabBar(
          isScrollable: true,
          controller: _tabcontrol,
          tabs: <Widget>[
            new Tab(text: "India"), //1
            new Tab(text: "World"), //2
            new Tab(text: "Buissness"), //3
            new Tab(text: "Technology"), //4
            new Tab(text: "Science"), //5
            new Tab(text: "Entertainment"), //6
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabcontrol,
        children: <Widget>[
          new Center(
            child: NewsPage(url: IndiaUrl,),
          ),
          new Center(
            child: NewsPage(url: worldUrl,),
          ),
          new Center(
            child: NewsPage(url: businessUrl,),
          ),
          new Center(
            child: NewsPage(url: techUrl,),
          ),
          new Center(
            child: NewsPage(url: scienceUrl,),
          ),
          new Center(
            child: NewsPage(url: entertainmentUrl,),
          ),
        ],
      ),
     )
    );
  }
}
