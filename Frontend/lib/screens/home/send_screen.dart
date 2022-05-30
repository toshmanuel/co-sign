import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/controllers/controllers.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key}) : super(key: key);
  static const id = 'send_screen';

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final addressController = TextEditingController();
  final recipientController = TextEditingController();
  final amountController = TextEditingController();
  final privateKeyController = TextEditingController();
  final privateKeyTwoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  final _transactionController = Get.put(TransactionController());

  createTransVariable() {
    final privateKeys = [
      privateKeyController.text,
      privateKeyTwoController.text
    ];

    return {
      'recipient': recipientController.text,
      'amount': amountController.text,
      'private_keys': privateKeys,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TransactionController>(
        builder: (_) => ModalProgressHUD(
          inAsyncCall: _transactionController.isLoading,
          progressIndicator: const Loading(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 30, left: 30, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: AppColors.skyBlueColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppVectors.arrowLeft,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        onTap: () {
                          goBack(context);
                        },
                      ),
                      Text(
                        'Send Satoshis',
                        style: AppTextStyle.textSize18.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'Create Transcation',
                          style: AppTextStyle.textSize18.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Height50(),
                        Height15(),
                        TextFormField(
                          cursorColor: AppColors.primaryColor,
                          controller: recipientController,
                          onSaved: (value) {
                            recipientController.text = value!;
                          },
                          autofocus: false,
                          textInputAction: TextInputAction.done,
                          decoration: AppDecorations.formStyle.copyWith(
                            label: Text(
                              'Recipient',
                              style: AppTextStyle.textSize15
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        Height15(),
                        TextFormField(
                          cursorColor: AppColors.primaryColor,
                          controller: amountController,
                          onSaved: (value) {
                            amountController.text = value!;
                          },
                          autofocus: false,
                          textInputAction: TextInputAction.done,
                          decoration: AppDecorations.formStyle.copyWith(
                            label: Text(
                              'Amount',
                              style: AppTextStyle.textSize15
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        Height15(),
                        TextFormField(
                          cursorColor: AppColors.primaryColor,
                          controller: privateKeyController,
                          onSaved: (value) {
                            privateKeyController.text = value!;
                          },
                          autofocus: false,
                          textInputAction: TextInputAction.done,
                          decoration: AppDecorations.formStyle.copyWith(
                            label: Text(
                              'Private Key 1',
                              style: AppTextStyle.textSize15
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        Height15(),
                        TextFormField(
                          cursorColor: AppColors.primaryColor,
                          controller: privateKeyTwoController,
                          onSaved: (value) {
                            privateKeyTwoController.text = value!;
                          },
                          autofocus: false,
                          textInputAction: TextInputAction.done,
                          decoration: AppDecorations.formStyle.copyWith(
                            label: Text(
                              'Private Key 2 (Optional)',
                              style: AppTextStyle.textSize15
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        final createTnx = await _transactionController
                            .createTransactionQuery(createTransVariable());
                        if (createTnx) {}
                      }
                    },
                    text: Text('Create Transaction',
                        style: AppTextStyle.textSize21
                            .copyWith(color: AppColors.whiteColor)),
                    height: 60,
                    width: 335,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
