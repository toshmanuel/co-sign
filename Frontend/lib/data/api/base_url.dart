import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;
  final baseUrl = 'http://127.0.0.1:8000/api/v1/';
  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
  }
}
