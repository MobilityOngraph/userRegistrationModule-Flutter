import 'package:flutter_idealz/src/api_utils/RestApiCalls.dart';
import 'package:flutter_idealz/src/modals/login_data.dart';

abstract class ForgotContract {
  void onForgotSuccess(bool b);

  void onForgotError(String errorTxt);
}

class ForgotPresenter {
  ForgotContract _view;
  RestApiCalls api = new RestApiCalls();

  ForgotPresenter(this._view);

  doForgotPassword(
      String bdy,String url
      ) {
    api.forgotPassword(bdy,url).then((bool b) {
      _view.onForgotSuccess(b);
    }).catchError((Object error) => _view.onForgotError(error.toString()));
  }
}
