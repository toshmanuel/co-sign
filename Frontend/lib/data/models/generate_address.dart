class GenerateAddress {
  GenerateAddress({
    required this.status,
    required this.address,
  });
  late final int status;
  late final String address;

  GenerateAddress.fromJson(Map<String, dynamic> json) {
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