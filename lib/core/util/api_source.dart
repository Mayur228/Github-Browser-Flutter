import 'package:dio/dio.dart';

class ApiSource{
  ApiSource();
  Dio init() {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://api.github.com/';
    return dio;
  }
}