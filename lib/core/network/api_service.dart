import 'package:dio/dio.dart';
import 'package:movies_app/core/network/api_constants.dart';

class ApiService {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30)));
  }

   Future<Response> getData(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    
    return await dio.get(endpoint,
        queryParameters: queryParameters ,
        
        );
  }
}
