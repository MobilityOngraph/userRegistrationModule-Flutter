
class ApiConfig{
  static const String BASE_URL = "http://3.221.41.0/rest/V1/";

  static const String loginUrl = BASE_URL+"integration/customer/token";
  static const String registrationUrl = BASE_URL + "customers";
  static const String forgotPasswordUrl = BASE_URL + "customers/password";
  static const String GET_USER_DATA = BASE_URL+ "customers/me";
  static const String LOGOUT_USER = BASE_URL+ "integration/customer/revoke";
}