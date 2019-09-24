// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMessageResponse _$ApiMessageResponseFromJson(Map<String, dynamic> json) {
  return ApiMessageResponse(
    messageBody: json['messageBody'] == null
        ? null
        : MessageBody.fromJson(json['messageBody'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApiMessageResponseToJson(ApiMessageResponse instance) =>
    <String, dynamic>{
      'messageBody': instance.messageBody,
    };
