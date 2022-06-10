class GetAllTransactions {
  int? status;
  List<Transactions>? transactions;

  GetAllTransactions({this.status, this.transactions});

  GetAllTransactions.fromJson(Map<String, dynamic> json) {
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
  String? transactionId;
  String? recipient;
  int? amount;
  int? fee;
  String? transactionHex;
  String? dateCreated;
  bool? broadcasted;

  Transactions(
      {this.id,
      this.transactionId,
      this.recipient,
      this.amount,
      this.fee,
      this.transactionHex,
      this.dateCreated,
      this.broadcasted});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction id'];
    recipient = json['recipient'];
    amount = json['amount'];
    fee = json['fee'];
    transactionHex = json['transaction hex'];
    dateCreated = json['date created'];
    broadcasted = json['broadcasted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction id'] = this.transactionId;
    data['recipient'] = this.recipient;
    data['amount'] = this.amount;
    data['fee'] = this.fee;
    data['transaction hex'] = this.transactionHex;
    data['date created'] = this.dateCreated;
    data['broadcasted'] = this.broadcasted;
    return data;
  }
}