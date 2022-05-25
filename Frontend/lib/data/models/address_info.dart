class AddressInfo {
  AddressInfo({
    required this.address,
    required this.redeemscript,
  });
  late final String address;
  late final String redeemscript;

  AddressInfo.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    redeemscript = json['redeemscript'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['redeemscript'] = redeemscript;
    return _data;
  }
}