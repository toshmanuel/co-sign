import 'package:flutter/material.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/spacer.dart';
import 'package:frontend/widgets/widgets.dart';

class KeyCreation extends StatefulWidget {
  const KeyCreation({Key? key}) : super(key: key);
  static const id = 'key_creation';

  @override
  State<KeyCreation> createState() => _KeyCreationState();
}

class _KeyCreationState extends State<KeyCreation> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                      setupYourCoSignerText,
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
                          controller: nameController,
                          decoration: AppDecorations.formStyle.copyWith(
                            label: Text(
                              'Name',
                              style: AppTextStyle.textSize15
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        Height15(),
                        TextFormField(
                          cursorColor: AppColors.primaryColor,
                          autofocus: false,
                          controller: emailController,
                          decoration: AppDecorations.formStyle.copyWith(
                            label: Text(
                              'Email',
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
                              'Key',
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
                  text: Text('Create Key',
                      style: AppTextStyle.textSize21
                          .copyWith(color: AppColors.whiteColor)),
                  height: 60,
                  width: 335),
            ],
          ),
        ),
      ),
    );
  }
}
