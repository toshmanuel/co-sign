import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/data/api/api.dart';
import 'package:frontend/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiUtils {
  static ApiResponse toApiResponse(Response res) {
    return ApiResponse(
      statusCode: res.statusCode,
      statusMessage: res.statusMessage,
      data: res.data,
    );
  }
}
showToastAnyWhere(String message, {ToastGravity gravity = ToastGravity.TOP}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
