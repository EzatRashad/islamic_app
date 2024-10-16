import 'package:dio/dio.dart';

class AdhanDioHelper{
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.aladhan.com/v1/timingsByCity',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  
  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    var response = await dio.get(
      url,
      queryParameters: query,
    );

    return response;
  }
}
