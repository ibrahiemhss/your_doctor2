import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/data/user/base/event_user_object.dart';

part 'user_data.g.dart';

@JsonSerializable()
class User {
  var id;
  var firstname;
  var lastname;
  var email;
  var phone;
  var token;
var created_at;

var updated_at;
 var user_role;
var is_active;

var is_deleted;
var is_block ;
 var addbyll;

  User(
      {this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.phone,
        this.token,
        this.created_at,
        this.updated_at,
        this.is_active,
        this.is_deleted,
        this.is_block,this.addbyll});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

abstract class LogInUserRepository {
  Future<EventUserObject> fetchLogInUser(
      String email, String password);
}

abstract class RegisterUserRepository {
  Future<EventUserObject> fetchRegisteringUser(
      var email,
      var password,
      var firstname,
      var lastname,
      var phone
      );
}
abstract class ResetPasswordRepository {
  Future<EventUserObject> fetchResetingPassword(
      String name, String emailId, String password);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
