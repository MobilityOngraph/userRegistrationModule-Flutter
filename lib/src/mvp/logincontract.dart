import 'package:flutter_idealz/src/api_utils/RestApiCalls.dart';
import 'package:flutter_idealz/src/modals/login_data.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(LoginData user);

  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestApiCalls api = new RestApiCalls();

  LoginScreenPresenter(this._view);

  doLogin(
    String bdy,
  ) {
    api.login(bdy).then((LoginData user) {
      _view.onLoginSuccess(user);
    }).catchError((Object error) => _view.onLoginError(error.toString()));
  }
}
