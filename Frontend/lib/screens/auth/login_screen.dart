import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/screens/auth/forget_password.dart';
import 'package:frontend/screens/home/home.dart';
import 'package:frontend/screens/screens.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 150, bottom: 200, right: 65, left: 65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  AppVectors.logo,
                  width: 100,
                  height: 100,
                ),
              ),
              Height10(),
              Text(
                coSignText,
                style: AppTextStyle.textSize36
                    .copyWith(color: AppColors.blackColor),
              ),
              Height15(),
              Text(
                loginText,
                style: AppTextStyle.textSize24
                    .copyWith(color: AppColors.lightNeutral),
              ),
              Height15(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: AppColors.lightNeutral,
                      autofocus: false,
                      controller: emailController,
                      decoration: AppDecorations.formStyle.copyWith(
                        label: Text(
                          'Email',
                          style: AppTextStyle.textSize15
                              .copyWith(color: AppColors.lightNeutral),
                        ),
                      ),
                    ),
                    Height10(),
                    TextFormField(
                      cursorColor: AppColors.lightNeutral,
                      controller: passwordController,
                      onSaved: (value) {
                        passwordController.text = value!;
                      },
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      obscureText: _obscureText,
                      decoration: AppDecorations.formStyle.copyWith(
                        label: Text(
                          'Password',
                          style: AppTextStyle.textSize15
                              .copyWith(color: AppColors.lightNeutral),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.lightNeutral,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Height15(),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SetUpScreen.id);
                },
                text: Text('Login',
                    style: AppTextStyle.textSize21
                        .copyWith(color: AppColors.whiteColor)),
                height: 60,
                width: 335,
              ),
              Height10(),
              Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: dontHaveAnAccountText + '  ',
                      style: AppTextStyle.textSize13
                          .copyWith(color: AppColors.lightNeutral),
                      children: [
                        TextSpan(
                          text: signUpText,
                          style: AppTextStyle.textSize13.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, SignUpScreen.id);
                            },
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForgetPassword.id);
                      },
                      child: Text(
                        forgotPasswordText,
                        style: AppTextStyle.textSize13.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
