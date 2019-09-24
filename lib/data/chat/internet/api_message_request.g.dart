// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMessageRequest _$ApiMessageRequestFromJson(Map<String, dynamic> json) {
  return ApiMessageRequest(
    operation: json['operation'] as String,
    messageBody: json['messageBody'] == null
        ? null
        : MessageBody.fromJson(json['messageBody'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApiMessageRequestToJson(ApiMessageRequest instance) =>
    <String, dynamic>{
      'operation': instance.operation,
      'messageBody': instance.messageBody,
    };
