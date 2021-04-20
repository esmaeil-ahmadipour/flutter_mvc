import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ApiClient {
  Dio _dio;
  static const String END_POINT_USERS = '';
  static const String END_POINT_CARS = '';
  static const String URL = 'https://ea2.ir';
  static const String END_POINT = 'https://ea2.ir/uploads/cars/db.json';

  ApiClient() {
    BaseOptions options = new BaseOptions(
        baseUrl: kIsWeb
            ? END_POINT
            : END_POINT);
            // : 'http://10.0.2.2:3000/');
    _dio = new Dio(options);
  }
  Dio get dio => _dio;
}
