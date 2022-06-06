import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/controllers/controllers.dart';
import 'package:frontend/screens/screens.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  final _formKey = GlobalKey<FormState>();

  signInVariable() {
    return {
      'username': emailController.text,
      'password': passwordController.text,
    };
  }

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    //Todo: Remove this
    if (kDebugMode) {
      emailController.text = 'jay@byna.com';
      passwordController.text = 'P@55w0rd';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthenticationController>(
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
                      loginText,
                      style: AppTextStyle.textSize24
                          .copyWith(color: AppColors.lightNeutral),
                    ),
                    Height15(),
                    Column(
                      children: [
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
                                    return ("Email Is Requied");
                                  }
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
                                  validator: passwordValidator),
                            ],
                          ),
                        ),
                        Height15(),
                      ],
                    ),
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
                          final signIn = await _authenticationController
                              .signInQuery(signInVariable());
                          if (signIn) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                            );
                          }
                        } else {}
                      },
                      text: Text('Login',
                          style: AppTextStyle.textSize21
                              .copyWith(color: AppColors.whiteColor)),
                      height: 60,
                      width: 335,
                    ),
                    Height10(),
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
      ),
    );
  }
}
