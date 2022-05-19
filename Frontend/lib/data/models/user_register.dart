class UserRegister {
  String? email;
  String? password;
  String? password2;

  UserRegister({this.email, this.password, this.password2});

  UserRegister.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    password2 = json['password2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['password2'] = this.password2;
    return data;
  }
}
