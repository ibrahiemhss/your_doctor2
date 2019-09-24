// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUserResponse _$ApiUserResponseFromJson(Map<String, dynamic> json) {
  return ApiUserResponse(

    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApiUserResponseToJson(ApiUserResponse instance) =>
    <String, dynamic>{
      'user': instance.user
    };
