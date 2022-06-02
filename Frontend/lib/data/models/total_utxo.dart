class TotalUTXO {
  int? status;
  int? utxo;

  TotalUTXO({this.status, this.utxo});

  TotalUTXO.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    utxo = json['utxo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['utxo'] = this.utxo;
    return data;
  }
}