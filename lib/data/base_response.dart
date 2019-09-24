import 'package:json_annotation/json_annotation.dart';
import 'package:your_doctor/data/articles/articles_data.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse<T> {
  @JsonKey(name: 'data')
  @_Converter()
  final List<T> data;

  BaseResponse(
    this.data,
  );

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    switch (T) {
      case Article:
        return Article as T;
      // This will only work if `json` is a native JSON type:
      //   num, String, bool, null, etc
      // *and* is assignable to `T`.
      default:
        return json as T;
    }
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object;
  }
}
