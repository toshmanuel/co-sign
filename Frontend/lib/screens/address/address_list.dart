import 'package:flutter/material.dart';
import 'package:frontend/controllers/controllers.dart';
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
          itemCount: _addressController.addressList?.addresses.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _addressController.addressList?.addresses[index] ?? '',
              ),
            );
          },
        ),
      ),
    );
  }
}
