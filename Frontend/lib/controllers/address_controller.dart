import 'package:frontend/data/api/api.dart';
import 'package:frontend/data/data.dart';
import 'package:frontend/utils/utils.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressController extends GetxController {
  final CoSignApi _coSignApi = CoSignApi(baseUrl);

  GenerateAddresses? generateAddresses;
  AddressInfo? addressInfo;
  AddressList? addressList;

  bool isLoading = false;

  String? userToken;

  getCurrentToken() async {
    final SharedPreferences localStorage =
        await SharedPreferences.getInstance();
    userToken = localStorage.getString(tokenResponse);
  }

  generateAddressQuery(Map<String, dynamic> generateAddressDetails) async {
    await getCurrentToken();
    isLoading = true;
    update();
    const endPoint = '$baseUrl/generateaddress';
    final response = await _coSignApi.post(endPoint,
        body: generateAddressDetails, token: userToken);
    if (response?.statusCode == 200) {
      generateAddresses = GenerateAddresses.fromJson(response!.data);
      isLoading = false;
      update();
      return Future.value(true);
    }
    isLoading = true;
    return Future.value(false);
  }

  getAddressInfoQuery(int? address) async {
    getCurrentToken();
    isLoading = true;
    update();
    const endPoint = '$baseUrl/addressinfo/';
    final response = await _coSignApi.get(endPoint, token: userToken);
    if (response?.statusCode == 200) {
      isLoading = false;
      update();
      addressInfo = AddressInfo.fromJson(response!.data);
    }
    return addressInfo;
  }

  getAddressListQuery() async {
    getCurrentToken();
    isLoading = true;
    update();
    const endPoint = '$baseUrl/addresslist/';
    final response = await _coSignApi.get(endPoint, token: userToken);
    if (response?.statusCode == 200) {
      isLoading = false;
      update();
      addressList = AddressList.fromJson(response!.data);
    }
    return addressList;
  }
}
