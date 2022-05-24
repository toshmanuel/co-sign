class AddressList {
  AddressList({
    required this.addresses,
  });
  late final List<String> addresses;

  AddressList.fromJson(Map<String, dynamic> json) {
    addresses = List.castFrom<dynamic, String>(json['addresses']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['addresses'] = addresses;
    return _data;
  }
}