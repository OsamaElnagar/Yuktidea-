import 'package:dio/dio.dart';
import 'package:yuktidea_auth_flow/shared/components/strings.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://cinecompass.yuktidea.com/',
        receiveDataWhenStatusError: true,
      ),

    );
  }

  static Future<Response> postData({
    required String path,
     FormData? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwtToken',
    };
    return dio.post(
      path,
      data: data,
    );
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
    String lang = 'en',
    required String jwtToken,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $jwtToken',
    };
    return await dio.get(
      path,
    );
  }



}

