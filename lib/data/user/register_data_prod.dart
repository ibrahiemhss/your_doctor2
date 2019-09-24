import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as  http;
import 'package:dio/dio.dart';
import 'package:your_doctor/data/user/base/event_user_object.dart';
import 'package:your_doctor/data/user/internet/api_user_request.dart';
import 'package:your_doctor/data/user/internet/api_user_response.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

class ProdRegisterRepository implements RegisterUserRepository {

  @override
  Future<EventUserObject> fetchRegisteringUser(
  var email,
  var password,
  var firstname,
  var lastname,
  var phone) async {
  // TODO: implement fetchUser
  var queryParameters = {
  APIOperations.EMAIL: "ahmed.lsdf56544@gmail.com",
  APIOperations.PASSWORD: password,
  APIOperations.First_name: firstname,
  APIOperations.LastName:lastname,
  APIOperations.PHONE: phone
  };
  ApiUserRequest apiRequest = new ApiUserRequest();
  /*User user = new User(
  email : email,
  password: password,
  firstname: firstname,
  lastname: lastname,
  phone: phone);

   */

  Dio dio = new Dio();

  apiRequest.operation = APIOperations.REGISTER;


      try {
       // final encoding = APIConstants.OCTET_STREAM_ENCODING;
        final response = await dio.post (APIConstants.Api_REGISTER_URL,
            data: queryParameters,options: Options(
                method: 'POST',
                responseType: ResponseType.json // or ResponseType.JSON
            ));
        if (response != null) {

          print("Response is : ${response.data}");
          print("statusCode is : ${response.statusCode}");
          print("statusMessage is : ${response.statusMessage}");
          print("extra is : ${response.extra}");
        }
      } catch (Exception) {
        print(
            "errorIn Register =========>============>=========>is => ${Exception.toString()}");
        return EventUserObject();
      }


// TODO: implement fetchteColors
  }


}
