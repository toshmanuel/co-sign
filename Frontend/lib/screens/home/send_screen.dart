import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key}) : super(key: key);
  static const id = 'send_screen';

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  TextEditingController privateKeyController = TextEditingController();
  static List<String> friendsList = [];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Height50(),
                  TextFormField(
                    cursorColor: AppColors.primaryColor,
                    autofocus: false,
                    controller: emailController,
                    decoration: AppDecorations.formStyle.copyWith(
                      label: Text(
                        'Address',
                        style: AppTextStyle.textSize15
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  Height10(),
                  TextFormField(
                    cursorColor: AppColors.primaryColor,
                    controller: passwordController,
                    onSaved: (value) {
                      passwordController.text = value!;
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
                  Height10(),
                  TextFormField(
                    cursorColor: AppColors.primaryColor,
                    controller: password2Controller,
                    onSaved: (value) {
                      passwordController.text = value!;
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
                  Height10(),
                  TextFormField(
                    cursorColor: AppColors.primaryColor,
                    controller: password2Controller,
                    onSaved: (value) {
                      privateKeyController.text = value!;
                    },
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    decoration: AppDecorations.formStyle.copyWith(
                      label: Text(
                        'Private Key',
                        style: AppTextStyle.textSize15
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              onPressed: () {},
              text: Text('Create Transaction',
                  style: AppTextStyle.textSize21
                      .copyWith(color: AppColors.whiteColor)),
              height: 60,
              width: 335,
            ),
          ],
        ),
      ),
    );
  }
}
