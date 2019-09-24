import 'package:your_doctor/data/user/base/event_user_object.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class LogInContract {
  void onLoadLogInCompleted(EventUserObject data);

  void onLoadLogIngError();
}

class LogInPresenter {
  LogInContract _view;
  LogInUserRepository _repository;

  LogInPresenter(this._view) {
    _repository = new Injector().logInRepository;
  }

  void loadLogIn(String email, String password) {
    _repository
        .fetchLogInUser(email, password)
        .then((c) => _view.onLoadLogInCompleted(c))
        .catchError((onError) => _view.onLoadLogIngError());
  }
}
