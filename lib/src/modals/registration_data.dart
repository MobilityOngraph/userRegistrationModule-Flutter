import 'dart:core';

class RegistrationData {
  int id;
  int group_id;
  String created_at;
  String updated_at;
  String created_in;
  String firstname;
  String lastname;
  String email;
  int store_id;
  int website_id;
  int disable_auto_group_change;
  var addresses = new List();
  String message;

  RegistrationData(
      {this.message,
      this.id,
      this.group_id,
      this.store_id,
      this.website_id,
      this.disable_auto_group_change,
      this.created_at,
      this.updated_at,
      this.created_in,
      this.firstname,
      this.lastname,
      this.email,
      this.addresses});

  RegistrationData.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null ? json['message'] : "";
    id = json['id'] != null ? json['id'] : 0;
    group_id = json['group_id'] != null ? json['group_id'] : 0;
    store_id = json['store_id'] != null ? json['store_id'] : 0;
    disable_auto_group_change = json['disable_auto_group_change'] != null
        ? json['disable_auto_group_change']
        : 0;
    created_at = json['created_at'] != null ? json['created_at'] : "";
    updated_at = json['updated_at'] != null ? json['updated_at'] : "";
    created_in = json['created_in'] != null ? json['created_in'] : "";
    firstname = json['firstname'] != null ? json['firstname'] : "";
    lastname = json['lastname'] != null ? json['lastname'] : "";
    email = json['email'] != null ? json['email'] : "";
    addresses = json['addresses'] != null ? json['addresses'] : new List();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.group_id != null) {
      data['group_id'] = this.group_id;
    }
    if (this.store_id != null) {
      data['store_id'] = this.store_id;
    }
    if (this.disable_auto_group_change != null) {
      data['disable_auto_group_change'] = this.disable_auto_group_change;
    }
    if (this.created_at != null) {
      data['created_at'] = this.created_at;
    }
    if (this.updated_at != null) {
      data['updated_at'] = this.updated_at;
    }
    if (this.created_in != null) {
      data['created_in'] = this.created_in;
    }
    if (this.firstname != null) {
      data['firstname'] = this.firstname;
    }
    if (this.lastname != null) {
      data['lastname'] = this.lastname;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.addresses != null || this.addresses.length != 0) {
      data['addresses'] = this.addresses;
    }
    return data;
  }
}
