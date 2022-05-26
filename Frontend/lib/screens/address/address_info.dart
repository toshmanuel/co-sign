import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Future<void> _copyToClipboard() async {
    await Clipboard.setData(const ClipboardData(text: 'your text'));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, right: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address:',
                    textAlign: TextAlign.right,
                    style: AppTextStyle.textSize18.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Clipboard.setData(
                        const ClipboardData(text: "your text"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Text copied to clipboard"),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.copy_rounded,
                      size: 20.0,
                      color: AppColors.primaryColor,
                    ),
                    label: Text(
                      '2N9EgUg8Rt8WtvT1FgNHe55BJ41zbe1SUF7',
                      style: AppTextStyle.textSize13
                          .copyWith(color: AppColors.lightNeutral),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomButton(
                  onPressed: () {},
                  text: Text('Import Address',
                      style: AppTextStyle.textSize21
                          .copyWith(color: AppColors.whiteColor)),
                  height: 60,
                  width: 335,
                ),
                Height15(),
                Center(
                  child: Text(
                    'Tap on the address to copy',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textSize15
                        .copyWith(color: AppColors.lightNeutral),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
