class BroadcastTransaction {
  int? status;
  String? transaction;
  bool? broadcasted;

  BroadcastTransaction({this.status, this.transaction, this.broadcasted});

  BroadcastTransaction.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    transaction = json['transaction'];
    broadcasted = json['broadcasted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['transaction'] = this.transaction;
    data['broadcasted'] = this.broadcasted;
    return data;
  }
}