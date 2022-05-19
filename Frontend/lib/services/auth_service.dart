import 'package:frontend/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/data/models/models.dart';


class AuthServices {
  static AuthServices? _instance;
  static AuthServices get getInstance {
    return _instance = _instance ?? AuthServices();
  }

  final isLoggedInKey = 'is_loggedIn';
  final userIdKey = 'user_id';
  final tokenKey = 'token';

  // Future saveUserDetails(
  //   UserModel userModel,bool isUpdate
  // ) async {
  //   await _setLoggedInKeys(userModel);
  // }

  setLoggedInKeys(userLogin) async {
    await setSharedPrefBool(isLoggedInKey, true);
    await setSharedPrefString(tokenKey, userLogin.accessToken);
  }

  saveUserDetails(UserLogin? userLogin, {bool isLogin = false}) async {
    await setSharedPrefString(
        username, userLogin?.username ?? '');
    await setSharedPrefString(
       username, userLogin?.username ?? '');

    await setSharedPrefString(
        username, userLogin?.username ?? '');
    if (isLogin) {
      await setSharedPrefString(username, userLogin?.username ?? '');
    }
   // await setSharedPrefInt(username, userLogin?.username ?? '');

    await setSharedPrefBool(username, true);
  }

  unSetLogginInkeys() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<String?> getSharedPrefString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future setSharedPrefString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  static removeSharedPrefString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  static Future setSharedPrefDouble(String key, double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setDouble(key, value);
  }

  static Future<double?> getSharedPrefDouble(String? key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key!);
  }

  static Future setSharedPrefInt(String key, int? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(key, value!);
  }

  static Future<dynamic> getSharedPref(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static Future<bool?> getSharedPrefBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future setSharedPrefBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(key, value);
  }
}
