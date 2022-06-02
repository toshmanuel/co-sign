import 'package:flutter/material.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/screens/screens.dart';
import 'package:frontend/utils/utils.dart';
import 'package:get/get.dart';

void main() async {
  runApp(
    CoSign(),
  );
}

class CoSign extends StatelessWidget {
  CoSign({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.defaultTheme.copyWith(
                  pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                  TargetPlatform.iOS: ZoomPageTransitionsBuilder()
                },
              )),
              home: const SplashScreen(),
              initialRoute: SplashScreen.id,
              routes: routes,
            );
          },
        );
      },
    );
  }
}
