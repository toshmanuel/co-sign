import 'package:flutter/material.dart';
import 'package:frontend/data/api/api.dart';
import 'package:frontend/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../data/models/models.dart';
import '../screens/screens.dart';

class AuthenticationController extends GetxController {
  final CoSignApi _coSignApi = CoSignApi(baseUrl);
  bool isLoading = false;

  UserRegister? userRegister;
  UserLogin? userLogin;

  siginUpQuery(BuildContext context, Map<String, dynamic> signUpDetails) async {
    isLoading = true;
    update();
    final endPoint = '/register';
    final response = await _coSignApi.post(endPoint, body: signUpDetails);
    if (response?.statusCode == 200) {
      userRegister = UserRegister.fromJson(response!.data);
      isLoading = false;

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginScreen()));
      isLoading = false;
      print(userRegister?.email);
    }
    isLoading = false;
    update();
  }

  signInQuery(BuildContext context, Map<String, dynamic> signInDetails) async {
    isLoading = true;
    update();
    final endPoint = '/login';
    final response = await _coSignApi.post(endPoint, body: signInDetails);
    if (response?.statusCode == 201) {
      userLogin = UserLogin.fromJson(response!.data);
      update();
      await _authServices.saveUserDetails(userLogin, isLogin: true);
      isLoading = false;

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => SetUpScreen()));
      isLoading = false;
      print(userLogin?.username);
    }
    isLoading = false;
    update();
  }
}
