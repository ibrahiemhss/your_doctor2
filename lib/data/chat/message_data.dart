import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';

part 'message_data.g.dart';

/// Message is class defining message data (id and text)

@JsonSerializable()
class Messages {
  /// id is unique ID of message
  final int msg_id;
  final String sender_name;
  final String reciver_name;
  final String sender_id;
  final int on_sender_id;

  final String receiver_id;
  final String isImage;

  //final String timeStamp;
  final String msg_content;
  final String created_at;

  Messages({this.msg_id,
    this.sender_name,
    this.reciver_name,
    this.sender_id,
    this.on_sender_id,
    this.receiver_id,
    this.msg_content,
    this.isImage,
    this.created_at}) {}

  factory Messages.fromJson(Map<String, dynamic> json) {
    return new Messages(
      msg_id: json['msg_id'] as int,
      sender_name: json['sender_name'] as String,
      reciver_name: json['reciver_name'] as String,
      on_sender_id: json['on_sender_id'] as int,
      sender_id: json['sender_id'] as String,
      receiver_id: json['receiver_id'] as String,
      msg_content: json['msg_content'] as String,
      isImage: json['is_image'] as String,
      created_at: json['created_at'] as String,
    );
  }

  Messages.fromMap(Map<String, dynamic> map)
      : msg_id = map['msg_id'],
        sender_name = map['sender_name'],
        reciver_name = map['reciver_name'],
        receiver_id = map['receiver_id'],
        sender_id = map['sender_id'],
        on_sender_id = map['on_sender_id'],
        msg_content = map['msg_content'],
        isImage = map['is_image'],
        created_at = map['created_at'];

/// Class constructor

/// Class constructor

}

abstract class GetMessagesRepository {
  Future<List<Messages>> getMessages(String sender_id, String receiver_id);
}

abstract class SendingMessageRepository {
  Future<EventMessageObject> sendMessage(
      String sender_id,
      String receiver_id,
      String sender_name,
      String reciver_name,
      String msg_content,
      File msg_pic_file,
      String isImage,
      String msg_created_at);
}
