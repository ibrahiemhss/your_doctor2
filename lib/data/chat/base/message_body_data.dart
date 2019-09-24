import 'package:json_annotation/json_annotation.dart';

part 'message_body_data.g.dart';

@JsonSerializable()
class MessageBody {
  @JsonKey(name: 'sender_name')
  final String senderName;
  @JsonKey(name: 'sender_id')
  final int senderId;
  @JsonKey(name: 'is_image')
  final String isImage;
  @JsonKey(name: 'msg_content')
  final String msgContent;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'message_status')
  final int messageStatus;

  MessageBody({
    this.senderName,
    this.senderId,
    this.msgContent,
    this.isImage,
    this.createdAt,
    this.messageStatus,
  });

  factory MessageBody.fromJson(Map<String, dynamic> json) {
    return _$MessageBodyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageBodyToJson(this);

}
