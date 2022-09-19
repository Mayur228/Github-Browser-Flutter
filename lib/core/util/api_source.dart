import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiSource{
  ApiSource();
  Dio init() {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://api.github.com/';
    return dio;
  }
}