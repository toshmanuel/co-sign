import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/screens/auth/auth.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/spacer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static const id = 'onboarding_screen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, bottom: 200),
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
                welcomeText,
                style: AppTextStyle.textSize24
                    .copyWith(color: AppColors.lightNeutral),
              ),
              Height10(),
              Text(
                coSignText,
                style: AppTextStyle.textSize36
                    .copyWith(color: AppColors.primaryColor),
              ),
              Height15(),
              CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.id);
                  },
                  text: Text('Login',
                      style: AppTextStyle.textSize21
                          .copyWith(color: AppColors.whiteColor)),
                  height: 60,
                  width: 335),
              Height30(),
              CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignUpScreen.id);
                  },
                  text: Text('Register',
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
