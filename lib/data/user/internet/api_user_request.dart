import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

part 'api_user_request.g.dart';

@JsonSerializable()
class ApiUserRequest {
  String operation;
  User user;

  ApiUserRequest({this.operation, this.user});

  factory ApiUserRequest.fromJson(Map<String, dynamic> json) =>
      _$ApiUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApiUserRequestToJson(this);

}
