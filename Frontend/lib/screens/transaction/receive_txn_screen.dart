import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/controllers/controllers.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ReceiveTnxScreen extends StatefulWidget {
  const ReceiveTnxScreen({Key? key}) : super(key: key);
  static const id = 'receive_txn_screen';

  @override
  State<ReceiveTnxScreen> createState() => _ReceiveTnxScreenState();
}

class _ReceiveTnxScreenState extends State<ReceiveTnxScreen> {
  final _transactionController = Get.put(TransactionController());

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _transactionController.getAllReceivedQuery();
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
                      .getAllReceivedTransactions?.transactions?.length,
                  itemBuilder: (context, index) {
                    final transaction = _transactionController
                        .getAllReceivedTransactions?.transactions![index];
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
                                text: 'Broadcasted: ',
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
                                text: 'ID: ',
                                style: AppTextStyle.textSize13.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: transaction?.id.toString() ?? '',
                                    style: AppTextStyle.textSize13.copyWith(
                                      color: AppColors.lightNeutral,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Clipboard.setData(
                                          ClipboardData(
                                              text:
                                                  transaction?.id.toString() ??
                                                      ''),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("ID copied to clipboard"),
                                          ),
                                        );
                                      },
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
      ),
    );
  }
}
