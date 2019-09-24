import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/module/articles_presenter.dart';
import 'package:your_doctor/util/constant.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';

//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:ui' as ui;

import 'article_route.dart';

class HomeScreenPage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreenPage> implements ArticlesContract {
  List<String> selectedItems = [];
  List<Article> _listArticles;
  ArticlesPresenter _articlesPresenter;

  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isLoading;
  int quantity = 1;

  // final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _HomePageState() {
    _articlesPresenter = ArticlesPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _articlesPresenter.loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: ThemeColors.Canvas,
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
              ),
            )
          : _homeWidget(),
    ));
  }

  Widget _homeWidget() {
    return Column(
      children: <Widget>[
        _articlesListItems(),
      ],
    );
  }

//------------------------------------------------------------------------------
  Widget _articlesListItems() {
    double _container_item_height;
    double _container_item_width;

    double _latest_column_item_width;
    double _container_lis_height;

    double _latest_container_item_width;
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      _container_item_height = MediaQuery.of(context).size.width / 8;
      _container_item_width = MediaQuery.of(context).size.height / 1.2;
      _container_lis_height = MediaQuery.of(context).size.width / 3;
    } else {
      _container_item_height = MediaQuery.of(context).size.height / 8;
      _container_item_width = MediaQuery.of(context).size.width / 1.2;
      _container_lis_height = MediaQuery.of(context).size.height / 4;
    }

    return Flexible(
      child: Container(
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: _listArticles.length,
          itemBuilder: (BuildContext context, int index) {
            final Article article = _listArticles[index];
            // final MaterialColor color = _colors[i % _colors.length];
            return _articleItem(article);
          },
        ),
      ),
    );
  }

  Widget _articleItem(Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleRoute(article),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        margin: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
        child: Container(
          width: 300,
          height: 250,
          child: Stack(
            //alignment:  Alignment(x, y)
            children: <Widget>[
              Positioned(
                top: 0.0,
                right: 0,
                left: 0,
                child: Container(
                  width: 300,
                  height: 180,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(article.postImage),
                        fit: BoxFit.contain),
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      article.postTitle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500, // light
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0.0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(15.0),
                        bottomRight: const Radius.circular(15.0),
                      ),
                      color: Colors.blue,
                    ),
                    height: 90,
                    width: 300,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 30.0,
                          right: 100.0,
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  "Dr: ${article.authorName}",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400, // light
                                      color: Colors.white),
                                ),
                                Text(
                                  "Specialty: ${article.authorJobTitle}",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300, // light
                                      color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 20.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              article.postDate,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300, // light
                                  color: Colors.white70),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                bottom: 60.0,
                right: 50.0,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(article.postImage)),
              ),
            ],
          ),
        ),
      ),
    );
  }

//------------------------------------------------------------------------------

//==============================================================================
  @override
  void onLoadArticlesCompleted(List<Article> items) {
    // TODO: implement onLoadArticlesCompleted

    setState(() {
      _listArticles = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadArticlesError() {
    // TODO: implement onLoadArticlesError
  }
}
