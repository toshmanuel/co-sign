import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/screens/screens.dart';
import 'package:frontend/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    const HomePage(),
    const AddressScreen(),
    const TransactonScreen(),
    const AboutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: tabPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        elevation: 10,
        selectedItemColor: AppColors.primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppVectors.homeLogo,
              color: selectedIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.lightNeutral,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppVectors.keyLogo,
              color: selectedIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.lightNeutral,
            ),
            label: 'Sign Address',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppVectors.transLogo,
              color: selectedIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.lightNeutral,
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppVectors.contactLogo,
              color: selectedIndex == 3
                  ? AppColors.primaryColor
                  : AppColors.lightNeutral,
            ),
            label: 'About',
          ),
        ],
        onTap: (_onItemTapped),
      ),
    );
  }
}
