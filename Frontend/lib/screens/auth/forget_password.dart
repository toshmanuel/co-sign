import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/screens/auth/auth.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);
  static const id = 'forget_password';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    AppVectors.logo,
                    width: 150,
                    height: 150,
                  ),
                ),
                Text(
                  coSignText,
                  style: AppTextStyle.textSize36
                      .copyWith(color: AppColors.primaryColor),
                ),
                Height10(),
                Text(
                  resetPasswordText,
                  style: AppTextStyle.textSize24
                      .copyWith(color: AppColors.lightNeutral),
                ),
                Height20(),
                Form(
                  key: _formKey,
                  child: TextFormField(
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
                ),
                Height15(),
              ],
            ),
            Column(
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.id);
                  },
                  text: Text('Send Link',
                      style: AppTextStyle.textSize21
                          .copyWith(color: AppColors.whiteColor)),
                  height: 60,
                  width: 335,
                ),
                Height15(),
                Center(
                  child: Text(
                    'A link will will be sent to your email for password reset',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textSize15
                        .copyWith(color: AppColors.lightNeutral),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
