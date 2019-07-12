class RegistrationRequest {
  Customer customer;
  String password;

  RegistrationRequest({
    this.customer,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer'] = this.customer;
    data['password'] = this.password;
    return data;
  }
}

class Customer{
  String email;
  String firstname;
  String lastname;

  Customer({
    this.email,
    this.firstname,
    this.lastname,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    return data;
  }
}
