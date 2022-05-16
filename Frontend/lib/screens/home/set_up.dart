import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                  howItWorkText,
                  style: AppTextStyle.textSize22.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                children: [
                  Height20(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.skyBlueColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: AppTextStyle.textSize18.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width - 84),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 5),
                          child: Text(
                            eachCosignerText,
                            textAlign: TextAlign.justify,
                            style: AppTextStyle.textSize18.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightNeutral),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Height20(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.skyBlueColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: AppTextStyle.textSize18.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 5),
                        child: Text(
                          allCosignerText,
                          style: AppTextStyle.textSize18.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightNeutral),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Height20(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.skyBlueColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '3',
                            style: AppTextStyle.textSize18.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width - 84),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 5),
                          child: Text(
                            withAll3Text,
                            textAlign: TextAlign.justify,
                            style: AppTextStyle.textSize18.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightNeutral),
                          ),
                        ),
                      ),
                    ],
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
