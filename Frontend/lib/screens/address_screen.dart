import 'package:flutter/material.dart';
import 'package:frontend/widgets/widgets.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({ Key? key }) : super(key: key);
  static const id = 'address_screen';

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }
}