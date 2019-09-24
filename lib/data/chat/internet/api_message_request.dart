import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/util/constant.dart';
import 'package:your_doctor/data/chat/base/message_body_data.dart';

part 'api_message_request.g.dart';

@JsonSerializable()
class ApiMessageRequest {
  String operation;
  MessageBody messageBody;

  ApiMessageRequest({this.operation, this.messageBody});

  factory ApiMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageRequestFromJson(json);


}
