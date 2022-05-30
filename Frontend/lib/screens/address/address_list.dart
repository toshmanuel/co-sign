import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key? key}) : super(key: key);
  static const id = 'address_list';

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  final titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(title: Text('List 1')),
          ListTile(title: Text('List 2')),
          ListTile(title: Text('List 3')),
        ],
      ),
    );
  }
}
