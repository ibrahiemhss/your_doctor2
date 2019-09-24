import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/util/constant.dart';

class ArticleRoute extends StatefulWidget {
  final Article article;

  ArticleRoute(
    @required this.article,) : assert(article != null);

  @override
  _ArticleRouteState createState() => _ArticleRouteState();
}

class _ArticleRouteState extends State<ArticleRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appBar("Dr: ${widget.article.authorName}"),
      body: Container(
        decoration: ThemeColors.Canvas,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                widget.article.postImage,
                fit: BoxFit.scaleDown,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Center(
                  key: GlobalObjectKey(widget.article),
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget.article.postTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                      ),
                      Html(
                        data: widget.article.postContent,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar(String title) {
    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      }
      assert(false);
      return null;
    }

    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(_backIcon()),
        color: Colors.white,
        alignment: Alignment.centerLeft,
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(title),
      backgroundColor: ThemeColors.CanvasColor,
    );
  }
}
