import '../models/post_model.dart';
import '../service/api_service.dart';

class ApiRepository {
  const ApiRepository({
    required this.apiService,
  });
  final ApiService apiService;

  Future<List<Post>?> getPostList() async {
    final response = await apiService.getPostData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (singlePost) => Post.fromMap(singlePost),
          )
          .toList();
    }
  }
}
