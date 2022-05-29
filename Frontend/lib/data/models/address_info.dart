class AddressInfo {
  AddressInfo({
    required this.address,
    required this.txid,
    required this.value,
    required this.vout,
  });
  late final String address;
  late final String txid;
  late final int value;
  late final int vout;

  AddressInfo.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    txid = json['txid'];
    value = json['value'];
    vout = json['vout'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['txid'] = txid;
    _data['value'] = value;
    _data['vout'] = vout;
    return _data;
  }
}