import 'package:bloc_data_get/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getPostData() async {
    try {
      final Response? response = await _dio.get('$baseUrl$posts');
      return response;
    } catch (ex) {
      print("Error: $ex");
    }
  }
}
