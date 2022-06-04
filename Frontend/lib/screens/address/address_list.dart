import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/controllers/controllers.dart';
import 'package:frontend/utils/utils.dart';
import 'package:get/get.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key? key}) : super(key: key);
  static const id = 'address_list';

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  bool loading = true;

  final _addressController = Get.put(AddressController());
  void init() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _addressController.addressListQuery();
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  int index = -2;

  final numbers = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddressController>(
        builder: (_) => ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: _addressController.addressList?.addresses.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              borderOnForeground: true,
              margin: const EdgeInsets.all(5),
              elevation: 5,
              child: ListTile(
                title: TextButton.icon(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: _addressController.addressList?.addresses[index],
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Copied address to clipboard"),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.copy_rounded,
                    size: 20.0,
                    color: AppColors.primaryColor,
                  ),
                  label: Text(
                    _addressController.addressList?.addresses[index] ?? '',
                    style: AppTextStyle.textSize12.copyWith(
                        color: AppColors.lightNeutral,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
