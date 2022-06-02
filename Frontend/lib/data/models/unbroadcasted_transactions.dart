class UnbroadcastedTransactions {
  int? status;
  List<Transactions>? transactions;

  UnbroadcastedTransactions({this.status, this.transactions});

  UnbroadcastedTransactions.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  int? id;
  String? recipient;
  int? amount;
  int? fee;
  String? dateCreated;
  bool? broadcasted;

  Transactions(
      {this.id,
      this.recipient,
      this.amount,
      this.fee,
      this.dateCreated,
      this.broadcasted});

  Transactions.fromJson(Map<String, dynamic> json) {
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