import 'package:your_doctor/data/doctors/doctors_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class DoctorsContract {
  void onLoadDoctorsCompleted(List<Doctors> items);

  void onLoadDoctorDetialsCompleted(Doctors item);

  void onLoadDoctorsError();
}

class DoctorsPresenter {
  DoctorsContract _view;
  DoctorsRepository _all_doctors_repository;
  SelctedDoctorsRepository _selcted_doctors_repository;
  DoctorDetailRepository _doctors_details_repository;

  DoctorsPresenter(this._view) {
    _all_doctors_repository = new Injector().doctorsRepository;
    _selcted_doctors_repository = new Injector().selcteddoctorsRepository;
    _doctors_details_repository = new Injector().doctorDetailsRepository;
  }

  void loadAllDoctors() {
    _all_doctors_repository
        .fetchAllDoctors()
        .then((c) => _view.onLoadDoctorsCompleted(c))
        .catchError((onError) => _view.onLoadDoctorsError());
  }

  void loadSelctedDoctors(String id) {
    _selcted_doctors_repository
        .fetchSelctedDoctors(id)
        .then((c) => _view.onLoadDoctorsCompleted(c))
        .catchError((onError) => _view.onLoadDoctorsError());
  }

  void loadDoctorDetails(String id) {
    _doctors_details_repository
        .fetchDoctotDetails(id)
        .then((c) => _view.onLoadDoctorDetialsCompleted(c))
        .catchError((onError) => _view.onLoadDoctorsError());
  }
}
