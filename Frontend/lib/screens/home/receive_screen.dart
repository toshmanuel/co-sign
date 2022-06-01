import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/controllers/controllers.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:get/get.dart';

class ReceiveScreen extends StatefulWidget {
  final String address;
  const ReceiveScreen({Key? key, required this.address}) : super(key: key);
  static const id = 'receive_screen';

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AddressController>(
          builder: (_) => Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 30, left: 30, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: AppColors.skyBlueColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppVectors.arrowLeft,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      onTap: () {
                        goBack(context);
                      },
                    ),
                    Text(
                      'Receive Satoshis',
                      style: AppTextStyle.textSize18.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  widget.address,
                  style: AppTextStyle.textSize14.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                CustomButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: widget.address),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Text copied to clipboard"),
                      ),
                    );
                  },
                  text: Text('Copy Address',
                      style: AppTextStyle.textSize21
                          .copyWith(color: AppColors.whiteColor)),
                  height: 60,
                  width: 335,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
