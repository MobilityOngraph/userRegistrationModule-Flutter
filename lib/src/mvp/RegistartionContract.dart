import 'package:flutter_idealz/src/api_utils/RestApiCalls.dart';
import 'package:flutter_idealz/src/modals/login_data.dart';
import 'package:flutter_idealz/src/modals/registration_data.dart';

abstract class RegistrationScreenContract {
  void onRegisterSuccess(RegistrationData user);

  void onRegisterError(String errorTxt);
}

class RegistrationScreenPresenter {
  RegistrationScreenContract _view;
  RestApiCalls api = new RestApiCalls();

  RegistrationScreenPresenter(this._view);

  doRegister(
      String bdy,
      ) {
    api.register(bdy).then((RegistrationData data) {
      _view.onRegisterSuccess(data);
    }).catchError((Object error) => _view.onRegisterError(error.toString()));
  }
}
