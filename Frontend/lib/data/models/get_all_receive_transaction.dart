class GetAllReceivedTransactions {
  int? status;
  List<Transactions>? transactions;

  GetAllReceivedTransactions({this.status, this.transactions});

  GetAllReceivedTransactions.fromJson(Map<String, dynamic> json) {
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
  String? id;
  int? amount;
  String? recipient;
  bool? broadcasted;

  Transactions({this.id, this.amount, this.recipient, this.broadcasted});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    recipient = json['recipient'];
    broadcasted = json['broadcasted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['recipient'] = this.recipient;
    data['broadcasted'] = this.broadcasted;
    return data;
  }
}
