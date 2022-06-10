import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/controllers/address_controller.dart';
import 'package:frontend/screens/screens.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../data/models/address_list.dart' as ad;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final key1Controller = TextEditingController();
  final key2Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _addressController = Get.put(AddressController());
  ad.AddressList? addresses;

  void init() async {
    await _addressController.totalUTXOQuery();
    addresses = await _addressController.addressListQuery();
  }

  generateAddressVariable() {
    return {
      'key1': key1Controller.text,
      'key2': key2Controller.text,
    };
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AddressController>(
          builder: (_) => ModalProgressHUD(
            inAsyncCall: _addressController.isLoading,
            progressIndicator: const Loading(),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, right: 30, left: 30, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Height50(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        text: _addressController.totalUTXO?.utxo
                                            .toString(),
                                        style: AppTextStyle.textSize22.copyWith(
                                            color: AppColors.primaryColor),
                                        children: [
                                          TextSpan(
                                            text: ' satoshis',
                                            style: AppTextStyle.textSize15
                                                .copyWith(
                                                    color:
                                                        AppColors.lightNeutral,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            width: 1.5,
                                            color: AppColors.primaryColor)),
                                    onPressed: () async {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const HomeScreen()));
                                    },
                                    child: const Text(
                                      'Refresh',
                                      style: TextStyle(
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                  addresses?.addresses.isEmpty == true
                                      ? showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            title: Column(
                                              children: [
                                                Height35(),
                                                const Text(
                                                  'Generate Address',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      AppTextStyle.textSize21,
                                                ),
                                                Height15(),
                                                const Text(
                                                  'As a new user need to generate an address',
                                                  style:
                                                      AppTextStyle.textSize14,
                                                ),
                                                Height25(),
                                                Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    children: [
                                                      TextFormField(
                                                        cursorColor: AppColors
                                                            .primaryColor,
                                                        autofocus: false,
                                                        controller:
                                                            key1Controller,
                                                        decoration:
                                                            AppDecorations
                                                                .formStyle
                                                                .copyWith(
                                                          label: Text(
                                                            'Key 1',
                                                            style: AppTextStyle
                                                                .textSize15
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .primaryColor),
                                                          ),
                                                        ),
                                                      ),
                                                      Height10(),
                                                      TextFormField(
                                                        cursorColor: AppColors
                                                            .primaryColor,
                                                        autofocus: false,
                                                        controller:
                                                            key2Controller,
                                                        decoration:
                                                            AppDecorations
                                                                .formStyle
                                                                .copyWith(
                                                          label: Text(
                                                            'Key 2',
                                                            style: AppTextStyle
                                                                .textSize15
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .primaryColor),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Height50(),
                                              ],
                                            ),
                                            content: Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Container(
                                                height: 50,
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(25),
                                                    ),
                                                    color:
                                                        AppColors.primaryColor),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await _addressController
                                                        .generateAddressQuery(
                                                            generateAddressVariable())
                                                        .then((address) {
                                                      _addressController
                                                          .addressListQuery();
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  ReceiveScreen(
                                                                      address:
                                                                          address,
                                                                      generateAddress:
                                                                          false)));
                                                    });
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      'Generate Address',
                                                      style: AppTextStyle
                                                          .textSize15
                                                          .copyWith(
                                                              color: AppColors
                                                                  .whiteColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Navigator.pushNamed(
                                          context, ReceiveScreen.id);
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
          ),
        ),
      ),
    );
  }
}
