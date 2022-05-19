import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/screens/auth/auth.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const id = 'sign_up_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureText1 = true;
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
                  width: 150,
                  height: 150,
                ),
              ),
              Height10(),
              Text(
                coSignText,
                style: AppTextStyle.textSize36
                    .copyWith(color: AppColors.primaryColor),
              ),
              Height10(),
              Text(
                signUpText,
                style: AppTextStyle.textSize24
                    .copyWith(color: AppColors.lightNeutral),
              ),
              Height15(),
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
                          'Email',
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
                      obscureText: _obscureText,
                      decoration: AppDecorations.formStyle.copyWith(
                        label: Text(
                          'Password',
                          style: AppTextStyle.textSize15
                              .copyWith(color: AppColors.primaryColor),
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
                    Height10(),
                    TextFormField(
                      cursorColor: AppColors.primaryColor,
                      controller: passwordController,
                      onSaved: (value) {
                        passwordController.text = value!;
                      },
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      obscureText: _obscureText1,
                      decoration: AppDecorations.formStyle.copyWith(
                        label: Text(
                          'Confirm Password',
                          style: AppTextStyle.textSize15
                              .copyWith(color: AppColors.primaryColor),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText1 = !_obscureText1;
                            });
                          },
                          child: Icon(
                            _obscureText1
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
                    Navigator.of(context).pushNamed(LoginScreen.id);
                  },
                  text: Text('Sign Up',
                      style: AppTextStyle.textSize21
                          .copyWith(color: AppColors.whiteColor)),
                  height: 60,
                  width: 335),
              Height10(),
              Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: alreadyHaveAnAccountText + '  ',
                      style: AppTextStyle.textSize13
                          .copyWith(color: AppColors.lightNeutral),
                      children: [
                        TextSpan(
                          text: loginText,
                          style: AppTextStyle.textSize13.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, LoginScreen.id);
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