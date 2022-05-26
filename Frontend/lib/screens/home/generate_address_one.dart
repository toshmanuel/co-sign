import 'package:flutter/material.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';

class GenerateAddressOne extends StatefulWidget {
  const GenerateAddressOne({Key? key}) : super(key: key);
  static const id = 'gen_address_one';

  @override
  State<GenerateAddressOne> createState() => _GenerateAddressOneState();
}

class _GenerateAddressOneState extends State<GenerateAddressOne> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 80, bottom: 200, right: 65, left: 65),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: Text(
                    summitYourText,
                    style: AppTextStyle.textSize22.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Height50(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: AppColors.primaryColor,
                        autofocus: false,
                        controller: emailController,
                        decoration: AppDecorations.formStyle.copyWith(
                          label: Text(
                            'Public Key',
                            style: AppTextStyle.textSize15
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Height50(),
              ],
            ),
            CustomButton(
                onPressed: () {},
                text: Text('Generate Address',
                    style: AppTextStyle.textSize21
                        .copyWith(color: AppColors.whiteColor)),
                height: 60,
                width: 335),
          ],
        ),
      ),
    );
  }
}
