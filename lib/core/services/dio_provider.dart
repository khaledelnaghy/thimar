import 'package:Thimar/core/constant/apis.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));
  }

  static Future<Response> getData(
      {required String endPoint,
      Map<String, dynamic>? header,
      Map<String, dynamic>? data}) async {
    return await dio.get(
      endPoint,
      data: data,
      options: Options(headers: header),
    );
  }

  static Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? header,
      Map<String, dynamic>? data}) async {
    return await dio.post(
      endPoint,
      options: Options(headers: header),
      data: data,
    );
  }

  static Future<Response> put(
      {required String endPoint,
      Map<String, dynamic>? header,
      Map<String, dynamic>? data}) async {
    return await dio.put(endPoint,
        options: Options(headers: header), data: data);
  }

  static Future<Response> delete(
      {required String endPoint,
      Map<String, dynamic>? header,
      Map<String, dynamic>? data}) async {
    return await dio.delete(endPoint,
        options: Options(headers: header), data: data);
  }
}
