import 'package:flutter/material.dart';
import 'package:frontend/controllers/controllers.dart';
import 'package:get/get.dart';

class UnbroadcastScreen extends StatefulWidget {
  const UnbroadcastScreen({Key? key}) : super(key: key);
  static const id = 'unbroadcast_screen';

  @override
  State<UnbroadcastScreen> createState() => _UnbroadcastScreenState();
}

class _UnbroadcastScreenState extends State<UnbroadcastScreen> {
  final _transactionController = Get.put(TransactionController());

  void init() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _transactionController.unbroadcastedTransactionsQuery();
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //     body: GetBuilder<TransactionController>(
    //   builder: (_) => ListView.builder(
    //     itemCount: _transactionController
    //         .unbroadcastedTransactions?.transactions?.length,
    //     itemBuilder: (context, index) {
    //     //   return ListTile(
    //     //     title: Text(
    //     // //    _transactionController.unbroadcastedTransactions?.transactions[index] ?? '',
    //     //     ),
    //     //   );
    //     // },
    //   )
    // ),
    );
  }
}
