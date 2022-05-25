import 'package:flutter/material.dart';
import 'package:frontend/widgets/widgets.dart';

class TransactonScreen extends StatefulWidget {
  const TransactonScreen({Key? key}) : super(key: key);
  static const id = 'transaction_screen';

  @override
  State<TransactonScreen> createState() => _TransactonScreenState();
}

class _TransactonScreenState extends State<TransactonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}
