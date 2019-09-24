import 'dart:io';

import 'package:your_doctor/data/user/base/event_user_object.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class RegisterUserContract {
  void onLoadRegisterCompleted(EventUserObject data);

  void onLoadRegisterError();
}

class RegisterPresenter {
  RegisterUserContract _view;
  RegisterUserRepository _repository;

  RegisterPresenter(this._view) {
    _repository = new Injector().regisetrRepository;
  }

  void loadRegister(String firstname,String lastname, String email, String phone,
      String password) {
    _repository
        .fetchRegisteringUser(
        email,firstname,lastname,  phone, password)
        .then((c) => _view.onLoadRegisterCompleted(c))
        .catchError((onError) => _view.onLoadRegisterError());
  }
}
