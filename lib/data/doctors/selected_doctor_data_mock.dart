import 'dart:async';

import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/data/doctors/doctors_data.dart';

class MockSelctedDoctorsRepository implements SelctedDoctorsRepository {
  @override
  Future<List<Doctors>> fetchSelctedDoctors(String id) {
    // TODO: implement fetch Categories
    return new Future.value(data);
  }
}

var data = <Doctors>[
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
  new Doctors(
    id: "1",
    name: "ahmed",
    specialty: "Bons",
    img:
    "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
  ),
];
