import 'package:frontend/data/api/api.dart';
import 'package:frontend/data/data.dart';
import 'package:frontend/services/services.dart';
import 'package:frontend/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthenticationController extends GetxController {
  final CoSignApi _coSignApi = CoSignApi(baseUrl);
  bool isLoading = false;

  UserRegister? userRegister;
  UserLogin? userLogin;

  final _authServices = AuthServices();

  Future<bool> signUpQuery(Map<String, dynamic> signUpDetails) async {
    isLoading = true;
    update();
    try {
      const endPoint = '$baseUrl/register/';

      final response = await _coSignApi.post(endPoint, body: signUpDetails);
      print(response);
      if (response?.statusCode == 201) {
        userRegister = UserRegister.fromJson(response!.data);
        isLoading = false;
        update();
        return Future.value(true);
      }

      isLoading = false;
      return Future.value(true);
    } catch (e) {
      print(e);
      isLoading = false;
      update();
      return Future.value(false);
    }
  }

  void setLoading(bool status) => isLoading = status;

  Future<bool> signInQuery(Map<String, dynamic> signInDetails) async {
    setLoading(true);
    update();

    try {
      const endPoint = '$baseUrl/login/';
      final response = await _coSignApi.post(endPoint, body: signInDetails);

      if (response?.statusCode == 200) {
        userLogin = UserLogin.fromJson(response!.data);
        await AuthServices.getInstance
            .saveUserDetails(userLogin, isLogin: true);

        setLoading(false);
        update();

        return Future.value(true);
      }

      setLoading(false);
      return Future.value(false);
    } catch (e) {
      setLoading(false);
      update();

      return Future.value(false);
    }
  }
}
