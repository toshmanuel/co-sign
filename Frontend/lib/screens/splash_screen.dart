import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/controllers/controllers.dart';
import 'package:frontend/screens/screens.dart';
import 'package:frontend/utils/utils.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const id = "splash_id";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  //late final StreamSubscription<_authenticationController.User?> listener;

  bool? isLoggedIn = false;
  Future<bool?> _splash() async {
    final SharedPreferences localStorage =
        await SharedPreferences.getInstance();

    isLoggedIn = localStorage.getBool(isLoggin);

    setState(() {});

    if (isLoggedIn != null && isLoggedIn == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const OnboardingScreen()));
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) => _splash());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                AppVectors.whiteLogo,
                width: 300,
                height: 300,
              ),
            ),
            Height40(),
            Text(
              'Co-Sign',
              style: AppTextStyle.textSize36.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
