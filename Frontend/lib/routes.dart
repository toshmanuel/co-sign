import 'package:flutter/material.dart';
import 'package:frontend/screens/screens.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.id: (context) => const LoginScreen(),
  OnboardingScreen.id: (context) => const OnboardingScreen(),
  SignUpScreen.id: (context) => const SignUpScreen(),
  ForgetPassword.id: (context) => const ForgetPassword(),
  SetUpScreen.id: (context) => const SetUpScreen(),
  GenerateAddressOne.id: (context) => const GenerateAddressOne(),
  GenerateAddressTwo.id: (context) => const GenerateAddressTwo(),
  HomePage.id: (context) => const HomePage(),
  AboutScreen.id: (context) => const AboutScreen(),
  AddressScreen.id: (context) => const AddressScreen(),
  TransactonScreen.id: (context) => const TransactonScreen(),
  HomeScreen.id: (context) => const HomeScreen(),
  AddressInfo.id: (context) => const AddressInfo(),
  AddressList.id: (context) => const AddressList(),
  SplashScreen.id: (context) => const SplashScreen(),
};
