// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_body_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageBody _$MessageBodyFromJson(Map<String, dynamic> json) {
  return MessageBody(
    senderName: json['sender_name'] as String,
    senderId: json['sender_id'] as int,
    msgContent: json['msg_content'] as String,
    isImage: json['is_image'] as String,
    createdAt: json['created_at'] as String,
    messageStatus: json['message_status'] as int,
  );
}

Map<String, dynamic> _$MessageBodyToJson(MessageBody instance) =>
    <String, dynamic>{
      'sender_name': instance.senderName,
      'sender_id': instance.senderId,
      'is_image': instance.isImage,
      'msg_content': instance.msgContent,
      'created_at': instance.createdAt,
      'message_status': instance.messageStatus,
    };
