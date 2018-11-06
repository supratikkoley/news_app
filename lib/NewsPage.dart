import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:news_app/News.dart';
import 'package:news_app/NewsReading.dart';

class NewsPage extends StatefulWidget {
  var url;
  NewsPage({this.url});
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
//  var url =
//      "https://newsapi.org/v2/top-headlines?country=in&query=technology&category=technology&pageSize=100&apiKey=f10ff2dc6015435488deae959371f83a";
  News news;

  _dateFormatter(String t) {
    DateTime datetime = DateTime.parse(t);

  }
  _fetchData() async {
    var res = await http.get(widget.url);
    var decodedRes = jsonDecode(res.body);
    news = News.fromJson(decodedRes);
//    for(int i=0; i<news.articles.length ;i++)
//    {
//      print(news.articles[i].urlToImage);
//    }
    print("time::${_dateFormatter(news.articles[0].publishedAt)}");

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print(news == null);
    return Scaffold(
      body: news == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: news == null ? 0 : news.articles.length,
              itemBuilder: (BuildContext ctx, int i) {
                debugPrint(news.articles[i].title);
                if (news.articles[i].urlToImage != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>NewsReading(
                                  arts: news.articles[i],
                                )),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              color: Colors.cyanAccent,
                              elevation: 3.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 200.0,
                                    width: 350.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              news.articles[i].urlToImage),
                                        fit: BoxFit.cover,
                                          ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,bottom: 8.0,right: 8.0),
                            child: Text(
                              news.articles[i].title,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                            ),
                          ),
                          )
                        ],
                      ),
                    )
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>NewsReading(
                            arts: news.articles[i],
                          )),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 3.0,
//                      color: Colors.cyanAccent,
                        child: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                news.articles[i].title,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500)         ,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
//                if (news.articles[i].urlToImage != null) {
//                  return Card(
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          height: 100.0,
//                          width: 100.0,
//                          decoration: BoxDecoration(
//                            image: DecorationImage(
//                                image: NetworkImage(news.articles[i].urlToImage),
//                                fit: BoxFit.contain,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  );
//                }
//                else{
//                  return Card(
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          height: 100.0,
//                          width: 100.0,
//                          child: Text(news.articles[i].title),
//                        ),
//                      ],
//                    ),
//                  );
//                }
              } ),
    );
  }
}
