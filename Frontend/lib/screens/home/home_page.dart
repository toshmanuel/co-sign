import 'package:flutter/material.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 80, bottom: 200, right: 65, left: 65),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                signTransText,
                textAlign: TextAlign.center,
                style: AppTextStyle.textSize22.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w600),
              ),
            ),
            CustomButton(
              onPressed: () {},
              text: Text('Generate with one public key',
                  style: AppTextStyle.textSize18
                      .copyWith(color: AppColors.whiteColor)),
              height: 60,
              width: 335,
            ),
            CustomButton(
              onPressed: () {},
              text: Text('Generate with two public key',
                  style: AppTextStyle.textSize18
                      .copyWith(color: AppColors.whiteColor)),
              height: 60,
              width: 335,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }
}
