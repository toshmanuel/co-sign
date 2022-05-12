import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/auth.dart';
import 'package:frontend/screens/auth/forget_password.dart';
import 'package:frontend/screens/auth/onboarding.dart';
import 'package:frontend/screens/home/home.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.id: (context) => const LoginScreen(),
  OnboardingScreen.id: (context) => const OnboardingScreen(),
  SignUpScreen.id: (context) => const SignUpScreen(),
  ForgetPassword.id: (context) => const ForgetPassword(),
  SetUpScreen.id: (context) => const SetUpScreen(),
};
