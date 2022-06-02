class TransactionDetails {
  int? status;
  Transaction? transaction;

  TransactionDetails({this.status, this.transaction});

  TransactionDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.toJson();
    }
    return data;
  }
}

class Transaction {
  int? id;
  String? recipient;
  int? amount;
  int? fee;
  String? dateCreated;
  bool? broadcasted;

  Transaction(
      {this.id,
      this.recipient,
      this.amount,
      this.fee,
      this.dateCreated,
      this.broadcasted});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipient = json['recipient'];
    amount = json['amount'];
    fee = json['fee'];
    dateCreated = json['date created'];
    broadcasted = json['broadcasted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipient'] = this.recipient;
    data['amount'] = this.amount;
    data['fee'] = this.fee;
    data['date created'] = this.dateCreated;
    data['broadcasted'] = this.broadcasted;
    return data;
  }
}