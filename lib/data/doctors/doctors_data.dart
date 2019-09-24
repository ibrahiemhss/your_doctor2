import 'dart:async';

class Doctors {
  String id;
  String name;
  String email;
  String phone;
  String img;
  String specialty;

  Doctors({
    this.id,
    this.name,
    this.email,
    this.specialty,
    this.img,
  });

  factory Doctors.fromJson(Map<String, dynamic> json) {
    return new Doctors(
      id: json['id'].toString(),
      name: json['name'].toString(),
      email: json['email'].toString(),
      specialty: json['specialty'].toString(),
      img: json['image'].toString(),
    );
  }

  Doctors.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        specialty = map['specialty'],
        img = map['image'];
}
class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
abstract class DoctorsRepository {
  Future<List<Doctors>> fetchAllDoctors();
}

abstract class SelctedDoctorsRepository {
  Future<List<Doctors>> fetchSelctedDoctors(String id);
}

abstract class DoctorDetailRepository {
  Future<Doctors> fetchDoctotDetails(String id);
}


