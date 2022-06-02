import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/controllers/controllers.dart';
import 'package:frontend/screens/auth/auth.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const id = 'sign_up_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool loading = false;
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  SignUpVariable() {
    return {
      'email': emailController.text,
      'password': passwordController.text,
      'password2': password2Controller.text,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveSafeArea(
        builder: (context, size) {
          Size _size = MediaQuery.of(context).size;
          return GetBuilder<AuthenticationController>(
            builder: (_) => ModalProgressHUD(
              inAsyncCall: _authenticationController.isLoading,
              progressIndicator: const Loading(),
              child: Padding(
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
                                    style: AppTextStyle.textSize15.copyWith(
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Email Is Require");
                                  }
                                  // reg expression for email validation
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return ("Enter A Valid Email");
                                  }
                                  return null;
                                },
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
                                    style: AppTextStyle.textSize15.copyWith(
                                        color: AppColors.primaryColor),
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
                                validator: passwordValidator,
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
                                obscureText: _obscureText1,
                                decoration: AppDecorations.formStyle.copyWith(
                                  label: Text(
                                    'Confirm Password',
                                    style: AppTextStyle.textSize15.copyWith(
                                        color: AppColors.primaryColor),
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
                                validator: (value) {
                                  if (password2Controller.text !=
                                      passwordController.text) {
                                    return "Password don't match";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Height15(),
                      ],
                    ),
                    Column(
                      children: [
                        CustomButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              final signUp = await _authenticationController
                                  .siginUpQuery(SignUpVariable());
                              if (signUp) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginScreen(),
                                  ),
                                );
                              } else {}
                            } else {}
                          },
                          text: Text('Sign Up',
                              style: AppTextStyle.textSize21
                                  .copyWith(color: AppColors.whiteColor)),
                          height: 60,
                          width: 335,
                        ),
                        Height10(),
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
                                    Navigator.pushNamed(
                                        context, LoginScreen.id);
                                  },
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ForgetPassword.id);
                          },
                          child: Text(
                            forgotPasswordText,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.textSize13.copyWith(
                              color: AppColors.primaryColor,
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
        },
      ),
    );
  }
}
