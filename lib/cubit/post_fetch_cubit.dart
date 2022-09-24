import 'package:bloc/bloc.dart';
import 'package:bloc_data_get/model/failure_model.dart';
import 'package:bloc_data_get/model/post_model.dart';
import 'package:bloc_data_get/reposutory/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {
  final ApiReposityry apiRepository;
  PostFetchCubit({required this.apiRepository}) : super(PostFetchInitial());

  Future<void> fetchPostApi() async {
    emit(PostFetchLoading());

    try {
      final List<Post>? postList = await apiRepository.getPostList();
      emit(PostFetchLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(PostFetchError(failure: err));
    } catch (ex) {
      print("Error: $ex");
    }
  }
}
