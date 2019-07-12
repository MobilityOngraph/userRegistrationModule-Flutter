class LoginData {
  String token;
  String message;

  LoginData({this.message, this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null ? json['message'] : "";
    token = json['token'] != null ? json['token'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.token != null) {
      data['token'] = this.token;
    }
    if (this.message != null) {
      data['message'] = this.message;
    }
    return data;
  }
}
