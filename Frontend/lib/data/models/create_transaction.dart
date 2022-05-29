class CreateTransaction {
  int? status;
  Null? transactionId;
  int? fee;
  int? amount;
  String? recipient;
  String? transactionHex;
  bool? broadcasted;

  CreateTransaction(
      {this.status,
      this.transactionId,
      this.fee,
      this.amount,
      this.recipient,
      this.transactionHex,
      this.broadcasted});

  CreateTransaction.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    transactionId = json['transaction id'];
    fee = json['fee'];
    amount = json['amount'];
    recipient = json['recipient'];
    transactionHex = json['transaction hex'];
    broadcasted = json['broadcasted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['transaction id'] = this.transactionId;
    data['fee'] = this.fee;
    data['amount'] = this.amount;
    data['recipient'] = this.recipient;
    data['transaction hex'] = this.transactionHex;
    data['broadcasted'] = this.broadcasted;
    return data;
  }
}