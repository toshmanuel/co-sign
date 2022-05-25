import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/text_style.dart';
import 'package:frontend/widgets/widgets.dart';

class AddressInfo extends StatefulWidget {
  const AddressInfo({Key? key}) : super(key: key);
  static const id = 'address_info';

  @override
  State<AddressInfo> createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 200, right: 15, left: 15),
      child: Column(children: [
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: 'Address:' + ' ',
            style: AppTextStyle.textSize18.copyWith(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: '2N9EgUg8Rt8WtvT1FgNHe55BJ41zbe1SUF7',
                style: AppTextStyle.textSize13.copyWith(
                  color: AppColors.lightNeutral,
                ),
              ),
            ],
          ),
        ),
        Height50(),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text: 'Redeemscript:' + ' ',
            style: AppTextStyle.textSize18.copyWith(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text:
                    'OP_2 029300dd10e1d997589cb1be26bb9ac34ecbe73e50ea2f868c309b90c7eef13e55 02a6fd879b0da776183ab9ea1608383149d016dd9e579e53bddaf4a9a60ed657a3 035dc71276a777bac9045f542d16d097bfeaa442a88df05e93bdb508fab2823a85 OP_3 OP_CHECKMULTISIG',
                style: AppTextStyle.textSize13.copyWith(
                  color: AppColors.lightNeutral,
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
