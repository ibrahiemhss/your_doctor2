import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

part 'articles_data.g.dart';

@JsonSerializable()
class Article {
  @JsonKey(name: 'post_url')
  String postUrl;
  @JsonKey(name: 'post_title')
  String postTitle;
  @JsonKey(name: 'post_content')
  String postContent;
  @JsonKey(name: 'post_image')
  String postImage;
  @JsonKey(name: 'post_views')
  int postViews;
  @JsonKey(name: 'post_date')
  String postDate;
  @JsonKey(name: 'Author_name')
  String authorName;
  @JsonKey(name: 'Author_job_title')
  String authorJobTitle;
  @JsonKey(name: 'Author_roles')
  String authorRoles;

  Article({
    String postUrl,
    String postTitle,
    String postContent,
    String postImage,
    int postViews,
    DateTime postDate,
    String authorName,
    String authorJobTitle,
    String authorRoles,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return _$ArticleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

abstract class ArticlesRepository {
  Future<List<Article>> fetchArticles();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
