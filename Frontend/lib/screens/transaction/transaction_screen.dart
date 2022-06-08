import 'package:flutter/material.dart';
import 'package:frontend/screens/screens.dart';
import 'package:frontend/utils/utils.dart';

class TransactonScreen extends StatefulWidget {
  const TransactonScreen({Key? key}) : super(key: key);
  static const id = 'transaction_screen';

  @override
  State<TransactonScreen> createState() => _TransactonScreenState();
}

class _TransactonScreenState extends State<TransactonScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.whiteColor,
          title: Text(
            'Transaction',
            style: AppTextStyle.textSize24.copyWith(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: AppColors.primaryColor,
            indicatorColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.lightNeutral,
            tabs: [
              Tab(icon: Icon(Icons.podcasts_sharp), text: 'Unbroadcast'),
              Tab(icon: Icon(Icons.file_download_outlined), text: 'Received'),
              Tab(icon: Icon(Icons.swap_vert), text: 'All Txn'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UnbroadcastScreen(),
            ReceiveTnxScreen(),
            SentTnxScreen(),
          ],
        ),
      ),
    );
  }
}
