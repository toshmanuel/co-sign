import 'package:flutter/material.dart';
import 'package:frontend/screens/home/home.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                signTransText,
                textAlign: TextAlign.center,
                style: AppTextStyle.textSize24.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        howItWorkText,
                        style: AppTextStyle.textSize22.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Height20(),
                    Row(
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
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Text(
                            eachCosignerText,
                            textAlign: TextAlign.justify,
                            style: AppTextStyle.textSize13.copyWith(
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
                    Height40(),
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
                            style: AppTextStyle.textSize13.copyWith(
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
                    Height40(),
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
                              style: AppTextStyle.textSize13.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightNeutral),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Height50(),
              ],
            ),
            Column(
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, GenerateAddressOne.id);
                  },
                  text: Text('Generate with one public key',
                      style: AppTextStyle.textSize18
                          .copyWith(color: AppColors.whiteColor)),
                  height: 60,
                  width: 335,
                ),
                Height20(),
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, GenerateAddressTwo.id);
                  },
                  text: Text('Generate with two public key',
                      style: AppTextStyle.textSize18
                          .copyWith(color: AppColors.whiteColor)),
                  height: 60,
                  width: 335,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
