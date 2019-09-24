// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Messages _$MessagesFromJson(Map<String, dynamic> json) {
  return Messages(
    msg_id: json['msg_id'] as int,
    sender_name: json['sender_name'] as String,
    reciver_name: json['reciver_name'] as String,
    sender_id: json['sender_id'] as String,
    on_sender_id: json['on_sender_id'] as int,
    receiver_id: json['receiver_id'] as String,
    msg_content: json['msg_content'] as String,
    isImage: json['isImage'] as String,
    created_at: json['created_at'] as String,
  );
}

Map<String, dynamic> _$MessagesToJson(Messages instance) =>
    <String, dynamic>{
      'msg_id': instance.msg_id,
      'sender_name': instance.sender_name,
      'reciver_name': instance.reciver_name,
      'sender_id': instance.sender_id,
      'on_sender_id': instance.on_sender_id,
      'receiver_id': instance.receiver_id,
      'isImage': instance.isImage,
      'msg_content': instance.msg_content,
      'created_at': instance.created_at,
    };
