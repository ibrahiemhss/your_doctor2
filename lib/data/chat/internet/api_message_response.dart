import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/data/chat/base/message_body_data.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/constant.dart';

part 'api_message_response.g.dart';

@JsonSerializable()
class ApiMessageResponse {
  MessageBody messageBody;

  ApiMessageResponse({this.messageBody});

  factory ApiMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageResponseFromJson(json);
}
