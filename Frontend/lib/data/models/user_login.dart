class UserLogin {
  UserLogin({
    required this.expiry,
    required this.token,
  });
  late final String expiry;
  late final String token;

  UserLogin.fromJson(Map<String, dynamic> json) {
    expiry = json['expiry'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['expiry'] = expiry;
    _data['token'] = token;
    return _data;
  }
}