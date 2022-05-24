class GenerateAddresses {
  GenerateAddresses({
    required this.status,
    required this.address,
  });
  late final int status;
  late final String address;

  GenerateAddresses.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['address'] = address;
    return _data;
  }
}