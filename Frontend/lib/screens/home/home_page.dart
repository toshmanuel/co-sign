import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      helloThereText,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textSize22.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SvgPicture.asset(
                      AppVectors.logo,
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
                Height40(),
                Column(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.skyBlueColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              totalBalanceText,
                              style: AppTextStyle.textSize22.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: '300,000',
                                  style: AppTextStyle.textSize22
                                      .copyWith(color: AppColors.primaryColor),
                                  children: [
                                    TextSpan(
                                      text: ' satoshis',
                                      style: AppTextStyle.textSize15.copyWith(
                                          color: AppColors.lightNeutral,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Height40(),
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: AppColors.skyBlueColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppVectors.transIcon,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    Height10(),
                    Text(
                      'Transaction History',
                      style: AppTextStyle.textSize13
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
                const Height30(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: AppColors.skyBlueColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppVectors.receiveLogo,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, ReceiveScreen.id);
                          },
                        ),
                        Height10(),
                        Text('Receive',
                            style: AppTextStyle.textSize13
                                .copyWith(color: AppColors.primaryColor)),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: AppColors.skyBlueColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppVectors.sendLogo,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, SendScreen.id);
                          },
                        ),
                        Height10(),
                        Text('Send',
                            style: AppTextStyle.textSize13
                                .copyWith(color: AppColors.primaryColor)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
