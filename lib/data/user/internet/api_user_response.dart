import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

part 'api_user_response.g.dart';

@JsonSerializable()
class ApiUserResponse {

  User user;

  ApiUserResponse({this.user});

  factory ApiUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiUserResponseFromJson(json);

}
