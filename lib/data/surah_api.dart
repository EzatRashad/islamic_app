import 'package:dio/dio.dart';

class SurahDioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://quranenc.com/api/v1/translation/sura/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String translationKey,
    required int suraNumber,
    required String language, // Added language parameter
  }) async {
    var response = await dio.get(
      '$translationKey/$suraNumber',
      queryParameters: {
        'language': language, // Include the language in query parameters
      },
    );
    return response;
  }
}