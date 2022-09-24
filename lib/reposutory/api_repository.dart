import 'package:bloc_data_get/service/api_screen.dart';

import '../model/post_model.dart';

class ApiReposityry {
  final ApiService apiServicec;
  const ApiReposityry({
    required this.apiServicec,
  });

  Future<List<Post>?> getPostList() async {
    final response = await apiServicec.getPostData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((singlePost) => Post.fromMap(singlePost)).toList();
    }
  }
}
