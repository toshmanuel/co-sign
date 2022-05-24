import 'package:frontend/data/api/api.dart';
import 'package:frontend/data/models/models.dart';
import 'package:frontend/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressController extends GetxController {
  final CoSignApi _coSignApi = CoSignApi(baseUrl);

  GenerateAddress? generateAddress;

  bool isLoading = false;

  String? userToken;

  getCurrentToken() async {
    final SharedPreferences localStorage =
        await SharedPreferences.getInstance();
    userToken = localStorage.getString(tokenResponse);
  }
}
