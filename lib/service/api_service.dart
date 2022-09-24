import 'dart:io';

import 'package:dio/dio.dart';

import '../models/failure_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getPostData() async {
    try {
      final Response? response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      return response;
    } on SocketException {
      throw const Failure(message: 'No Internet Connection');
    } catch (err) {
      print("Error :$err");
    }
  }
}
