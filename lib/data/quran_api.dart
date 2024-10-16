import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.quran.com/api/v4/',
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
