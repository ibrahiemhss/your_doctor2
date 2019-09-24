import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_doctor/data/doctors/doctors_data.dart';
import 'package:your_doctor/util/constant.dart';

class ProdDoctorRepository implements DoctorsRepository {

  @override
  Future<List<Doctors>> fetchAllDoctors() async{
    var response = await http.post(Uri.encodeFull(APIConstants.Api_GET_ALL_DOCTORS_URL),
        headers: {"Accept": "application/json"});
    List data = new List();
    var responseBody = json.decode(response.body);
    data = responseBody["users"];

    final statusCode = response.statusCode;
    if (statusCode != 200 || data == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    return (responseBody["users"] as List)
        .map((c) => new Doctors.fromJson(c))
        .toList();

  }
}