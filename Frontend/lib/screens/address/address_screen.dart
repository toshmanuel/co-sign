import 'package:flutter/material.dart';
import 'package:frontend/screens/address/address_info.dart';
import 'package:frontend/screens/address/address_list.dart';
import 'package:frontend/utils/utils.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);
  static const id = 'address_screen';

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.whiteColor,
          title: Text(
            'Address',
            style: AppTextStyle.textSize24.copyWith(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: AppColors.primaryColor,
            indicatorColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.lightNeutral,
            tabs: [
              Tab(icon: Icon(Icons.info_outline), text: 'Address Info'),
              Tab(icon: Icon(Icons.list_alt_rounded), text: 'List Of Address')
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AddressInfo(),
            AddressList(),
          ],
        ),
      ),
    );
  }
}
