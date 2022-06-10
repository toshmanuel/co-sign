import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/controllers/controllers.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SentTnxScreen extends StatefulWidget {
  const SentTnxScreen({Key? key}) : super(key: key);
  static const id = 'sent_txn_screen';

  @override
  State<SentTnxScreen> createState() => _SentTnxScreenState();
}

class _SentTnxScreenState extends State<SentTnxScreen> {
  final _transactionController = Get.put(TransactionController());

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _transactionController.getAllTransactionsQuery();
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TransactionController>(
        builder: (_) => ModalProgressHUD(
          inAsyncCall: _transactionController.isLoading,
          progressIndicator: const Loading(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _transactionController
                      .getAllTransactions?.transactions?.length,
                  itemBuilder: (context, index) {
                    final transaction = _transactionController
                        .getAllTransactions?.transactions![index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Recipient: ',
                                style: AppTextStyle.textSize13.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text:
                                        transaction?.recipient.toString() ?? '',
                                    style: AppTextStyle.textSize13.copyWith(
                                      color: AppColors.lightNeutral,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Height3(),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Amount: ',
                                style: AppTextStyle.textSize13.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: transaction?.amount.toString() ?? '',
                                    style: AppTextStyle.textSize13.copyWith(
                                      color: AppColors.lightNeutral,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Height3(),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Fee: ',
                                style: AppTextStyle.textSize13.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: transaction?.fee.toString() ?? '',
                                    style: AppTextStyle.textSize13.copyWith(
                                      color: AppColors.lightNeutral,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Height3(),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Broadcast: ',
                                style: AppTextStyle.textSize13.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: transaction?.broadcasted.toString() ??
                                        '',
                                    style: AppTextStyle.textSize13.copyWith(
                                      color: AppColors.lightNeutral,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Height3(),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Txn ID: ',
                                style: AppTextStyle.textSize13.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text:
                                        transaction?.transactionId.toString() ??
                                            '',
                                    style: AppTextStyle.textSize13.copyWith(
                                      color: AppColors.lightNeutral,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Height3(),
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Date: ',
                                style: AppTextStyle.textSize13.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: transaction?.dateCreated.toString() ??
                                        '',
                                    style: AppTextStyle.textSize13.copyWith(
                                      color: AppColors.lightNeutral,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 1.5,
                                        color: AppColors.primaryColor)),
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                        text: transaction?.transactionId
                                                .toString() ??
                                            ''),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("ID copied to clipboard"),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Copy Txn ID',
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
