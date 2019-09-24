import 'dart:async';

import 'package:your_doctor/data/doctors/doctors_data.dart';

class MockDoctorDetailsRepository implements DoctorDetailRepository {
  @override
  Future<Doctors> fetchDoctotDetails(String id) {
    // TODO: implement fetchDoctotDetails
    return new Future.value(data);
  }
}

var data = new Doctors(
  id: "1",
  name: "ahmed",
  specialty: "Bons",
  img:
      "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
);
