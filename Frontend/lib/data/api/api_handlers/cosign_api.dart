import 'dart:io';
import 'package:dio/dio.dart';
import 'package:frontend/data/api/api.dart';

class CoSignApi {
  final dio = Dio();

  CoSignApi(baseUrl) {
    dio.options.sendTimeout = 60000;
    dio.options.receiveTimeout = 60000;
    dio.options.baseUrl = baseUrl;
  }

  Future<dynamic> get(
    String string, {
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      final response = await dio.get(string.toString(),
          queryParameters: queryParameters,
          options: token == null
              ? null
              : Options(headers: {'Authorization': 'Bearer $token'}));

      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      if (e.response!.data!['message'] == String) {
      } else if (e.response!.data!['message'] != String) {}
    }
  }

  Future<dynamic> post(
    String string, {
    required Map<String, dynamic> body,
    String? token,
  }) async {
    try {
      print({'byna': string});
      final response = await dio.post(string,
          data: body,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      print({'byna': e});
      // if (e.response!.data!['message'] == String) {
      //   showToastAnyWhere(e.response!.data!['message']);
      // } else if (e.response!.data!['message'] != String) {
      //   showToastAnyWhere(e.response!.data!['message']);
      // }
    } on SocketException {}
  }

  Future<dynamic> put(
    String string, {
    required Map<String, dynamic> body,
    String? token,
  }) async {
    try {
      final response = await dio.put(string.toString(),
          data: body,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      if (e.response!.data!['message'] == String) {
      } else if (e.response!.data!['message'] != String) {}
    }
  }

  @override
  Future<ApiResponse?> patch(String path,
      {Map<String, dynamic>? body, String? token}) async {
    try {
      final res = await dio.patch(path,
          data: body,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ApiUtils.toApiResponse(res);
    } on DioError catch (e) {
      if (e.response!.data!['message'] == String) {
      } else if (e.response!.data!['message'] != String) {}
    } on SocketException {}
  }

  @override
  Future<ApiResponse?> delete(String string,
      {Map<String, dynamic>? body, String? token}) async {
    try {
      final response = await dio.delete(
        string,
        data: body,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      print(response);

      return ApiUtils.toApiResponse(response);
    } on DioError catch (e) {
      if (e.response!.data!['message'] == String) {
      } else if (e.response!.data!['message'] != String) {}
    }
  }
}
