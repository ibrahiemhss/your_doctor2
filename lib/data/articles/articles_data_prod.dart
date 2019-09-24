import 'dart:async';

import 'package:dio/dio.dart';
import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/data/base_response.dart';

class ProductionArticlesRepository implements ArticlesRepository {
  @override
  Future<List<Article>> fetchArticles() async {
    Dio dio = new Dio();
    Response response = await dio.get("http://urdocapi.com/api/v1/posts");
    if (response.statusCode != 200) {
      return null;
    }
    return BaseResponse<Article>.fromJson(response.data).data;
  }
}
