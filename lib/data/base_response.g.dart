// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) {
  return BaseResponse<T>(
    (json['data'] as List)?.map(_Converter<T>().fromJson)?.toList(),
  );
}

Map<String, dynamic> _$BaseResponseToJson<T>(BaseResponse<T> instance) =>
    <String, dynamic>{
      'data': instance.data?.map(_Converter<T>().toJson)?.toList(),
    };
