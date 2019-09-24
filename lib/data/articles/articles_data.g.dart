// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    postUrl: json['post_url'] as String,
    postTitle: json['post_title'] as String,
    postContent: json['post_content'] as String,
    postImage: json['post_image'] as String,
    postViews: json['post_views'] as int,
    postDate: json['post_date'] == null
        ? null
        : DateTime.parse(json['post_date'] as String),
    authorName: json['Author_name'] as String,
    authorJobTitle: json['Author_job_title'] as String,
    authorRoles: json['Author_roles'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) =>
    <String, dynamic>{
      'post_url': instance.postUrl,
      'post_title': instance.postTitle,
      'post_content': instance.postContent,
      'post_image': instance.postImage,
      'post_views': instance.postViews,
      'post_date': instance.postDate,
      'Author_name': instance.authorName,
      'Author_job_title': instance.authorJobTitle,
      'Author_roles': instance.authorRoles,
    };
