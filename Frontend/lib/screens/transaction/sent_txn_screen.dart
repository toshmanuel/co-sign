import 'package:flutter/material.dart';
import 'package:frontend/controllers/controllers.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:get/get.dart';

class SentTnxScreen extends StatefulWidget {
  const SentTnxScreen({Key? key}) : super(key: key);
  static const id = 'sent_txn_screen';

  @override
  State<SentTnxScreen> createState() => _SentTnxScreenState();
}

class _SentTnxScreenState extends State<SentTnxScreen> {
  final _transactionController = Get.put(TransactionController());

  void init() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
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
        builder: (_) => Column(
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
                                  text: transaction?.recipient.toString() ?? '',
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
                              text: 'Broadcasted: ',
                              style: AppTextStyle.textSize13.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text:
                                      transaction?.broadcasted.toString() ?? '',
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
                                  text:
                                      transaction?.dateCreated.toString() ?? '',
                                  style: AppTextStyle.textSize13.copyWith(
                                    color: AppColors.lightNeutral,
                                  ),
                                ),
                              ],
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
    );
  }
}
