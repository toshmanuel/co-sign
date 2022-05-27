import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';

class GenerateAddressTwo extends StatefulWidget {
  const GenerateAddressTwo({Key? key}) : super(key: key);
  static const id = 'gen_address_two';

  @override
  State<GenerateAddressTwo> createState() => _GenerateAddressTwoState();
}

class _GenerateAddressTwoState extends State<GenerateAddressTwo> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 80, bottom: 200, right: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: SvgPicture.asset(
                        AppVectors.arrowLeft,
                        color: AppColors.primaryColor,
                      ),
                      onTap: () {
                        goBack(context);
                      },
                    ),
                    Center(
                      child: Text(
                        summitYourKeysText,
                        style: AppTextStyle.textSize22.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Width5(),
                  ],
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
                            'Public Key 1',
                            style: AppTextStyle.textSize15
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                      Height15(),
                      TextFormField(
                        cursorColor: AppColors.primaryColor,
                        autofocus: false,
                        controller: keyController,
                        decoration: AppDecorations.formStyle.copyWith(
                          label: Text(
                            'Public Key 2',
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