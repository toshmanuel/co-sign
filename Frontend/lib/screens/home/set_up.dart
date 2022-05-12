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
                  style: AppTextStyle.textSize22.copyWith(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Height15(),
                      Text(
                        createPersonalWallet,
                        style: AppTextStyle.textSize21
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      Height3(),
                      Text(
                        quickSetUp,
                        style: AppTextStyle.textSize16
                            .copyWith(color: AppColors.lightNeutral),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    AppVectors.rightangle,
                  )
                ],
              ),
              Height15(),
              const Divider(
                height: 1,
                color: AppColors.lightNeutral,
              ),
              const Divider(
                height: 1,
                color: AppColors.lightNeutral,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Height15(),
                      Text(
                        createSharedWallet,
                        style: AppTextStyle.textSize21
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      Height3(),
                      Text(
                        shareControlOver,
                        style: AppTextStyle.textSize16
                            .copyWith(color: AppColors.lightNeutral),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    AppVectors.rightangle,
                  )
                ],
              ),
              Height15(),
              const Divider(
                height: 1,
                color: AppColors.lightNeutral,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Height15(),
                      Text(
                        importWallet,
                        style: AppTextStyle.textSize21
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      Height3(),
                      Text(
                        recoverWalletYou,
                        style: AppTextStyle.textSize16
                            .copyWith(color: AppColors.lightNeutral),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    AppVectors.rightangle,
                  )
                ],
              ),
              Height15(),
            ],
          ),
        ),
      ),
    );
  }
}
