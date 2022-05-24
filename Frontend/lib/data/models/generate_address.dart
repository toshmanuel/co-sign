class GenerateAddress {
  GenerateAddress({
    required this.key1,
    required this.key2,
  });
  late final String key1;
  late final String key2;

  GenerateAddress.fromJson(Map<String, dynamic> json) {
    key1 = json['key1'];
    key2 = json['key2'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key1'] = key1;
    _data['key2'] = key2;
    return _data;
  }
}
