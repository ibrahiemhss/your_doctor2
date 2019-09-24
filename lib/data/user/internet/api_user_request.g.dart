// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUserRequest _$ApiUserRequestFromJson(Map<String, dynamic> json) {
  return ApiUserRequest(
    operation: json['operation'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApiUserRequestToJson(ApiUserRequest instance) =>
    <String, dynamic>{
      'operation': instance.operation,
      'user': instance.user,
    };
