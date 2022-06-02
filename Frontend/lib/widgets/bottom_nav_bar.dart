import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/screens/screens.dart';
import 'package:frontend/utils/utils.dart';

class BottomNavBar extends StatefulWidget {
  static const id = 'bottom_nav_bar';
  final int selectedIndex;
  BottomNavBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool selectedIndex = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // boxShadow: [
          // BoxShadow(
          // blurRadius: 20,
          // color: Colors.white,
          // )
          // ],
          ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppVectors.homeLogo,
              color: AppColors.lightNeutral,
            ),
            activeIcon: SvgPicture.asset(
              AppVectors.homeLogo,
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppVectors.keyLogo,
              color: AppColors.lightNeutral,
            ),
            activeIcon: SvgPicture.asset(
              AppVectors.keyLogo,
              color: AppColors.primaryColor,
            ),
            label: 'Address',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppVectors.transLogo,
              color: AppColors.lightNeutral,
            ),
            activeIcon: SvgPicture.asset(
              AppVectors.transLogo,
              color: AppColors.primaryColor,
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppVectors.contactLogo,
              color: AppColors.lightNeutral,
            ),
            activeIcon: SvgPicture.asset(
              AppVectors.contactLogo,
              color: AppColors.primaryColor,
            ),
            label: 'About',
          ),
        ],
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.lightNeutral,
        elevation: 20,
        currentIndex: widget.selectedIndex,
        onTap: (index) {
          changeTab(index);
        },
      ),
    );
  }

  void goTo(String screen) {
    Navigator.pushNamed(context, screen);
  }

  changeTab(int index) {
    switch (index) {
      case 0:
        goTo(HomePage.id);
        break;
      case 1:
        goTo(AddressScreen.id);
        break;
      case 2:
        goTo(TransactonScreen.id);
        break;
      case 3:
        goTo(AboutScreen.id);
        break;

      default:
    }
  }
}
