// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
var id;
var fistname;
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

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int ,
    email: json['email'] ,
    firstname: json['fistname'] ,
    lastname: json['lastname'] ,
    phone: json['phone'] ,
    token: json['token'] ,
    addbyll: json['addbyll'],//beacause it null may make bug
    created_at: json['created_at'] ,
    updated_at: json['updated_at'] ,
    is_active: json['is_active'] ,
    is_deleted: json['is_deleted'] ,
    is_block: json['is_block']

  );
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
     
    };
