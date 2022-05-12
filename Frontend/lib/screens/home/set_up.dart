import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/utils/constant.dart';
import 'package:frontend/utils/text_style.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';

class SetUpScreen extends StatefulWidget {
  const SetUpScreen({Key? key}) : super(key: key);
  static const id = 'setup_screen';

  @override
  State<SetUpScreen> createState() => _SetUpScreenState();
}

class _SetUpScreenState extends State<SetUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  howDoYouWantToStart,
                  style: AppTextStyle.textSize21.copyWith(
                      color: AppColors.blackColor, fontWeight: FontWeight.w600),
                ),
              ),
              const Height30(),
              const Divider(
                height: 1,
                color: AppColors.lightNeutral,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'data',
                        style: AppTextStyle.textSize18,
                      ),
                      Text('data'),
                    ],
                  ),
                  SvgPicture.asset(AppVectors.rightangle)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
