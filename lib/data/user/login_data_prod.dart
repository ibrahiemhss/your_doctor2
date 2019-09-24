import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';


import 'package:your_doctor/data/user/base/event_user_object.dart';
import 'package:your_doctor/data/user/internet/api_user_request.dart';
import 'package:your_doctor/data/user/internet/api_user_response.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/constant.dart';

class ProdLogInRepository implements LogInUserRepository {
  @override
  Future<EventUserObject> fetchLogInUser(
      String email, String password) async {
    // TODO: implement fetchUser
    var queryParameters = {
      APIOperations.EMAIL: email,
      APIOperations.PASSWORD: password
    };

    Dio dio = new Dio();

    try {
      //  final encoding = APIConstants.OCTET_STREAM_ENCODING;
      final response = await dio.post(APIConstants.API_LOGIN_URL,
          data: queryParameters, options: Options(
              method: 'POST',
              responseType: ResponseType.json // or ResponseType.JSON
          ));
      if (response != null) {
        //  print("Response is 1 : ${response}");
        if (response.statusCode == APIResponseCode.SC_OK && response.statusCode == 200 ) {
          print(response.data);
          if( response.data.containsKey("success")){
            User userResponse = User.fromJson(response.data["user"]);
            print(userResponse);
return EventUserObject(object: userResponse,id:EventUserConstants.LOGIN_USER_SUCCESSFUL);
          }else{
            return EventUserObject(id:EventUserConstants.LOGIN_USER_UN_SUCCESSFUL);

          }
        }
      }
    }
    catch (Exception) {
      print(
          "errorIn LogIn =========>============>=========>is => ${Exception.toString()}");

      return EventUserObject();
    }
  }
// TODO: implement fetchteColors

}

/*
return new EventUserObject(
id: EventUserConstants.LOGIN_USER_SUCCESSFUL,
messageResponse: "Successful",
object:
apiResponse.user);

 */