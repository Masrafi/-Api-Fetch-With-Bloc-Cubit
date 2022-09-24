import 'package:bloc_data_get/cubit/post_fetch_cubit.dart';
import 'package:bloc_data_get/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch fata from APi"),
      ),
      body: BlocBuilder<PostFetchCubit, PostFetchState>(
        builder: (context, state) {
          if (state is PostFetchLoaded) {
            return CircularProgressIndicator();
          } else if (state is PostFetchError) {
            return Text(state.failure.message);
          } else if (state is PostFetchLoaded) {
            final postList = state.postList;
            return postList.isEmpty
                ? const Text("No any post")
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      final Post singlePost = postList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(singlePost.id.toString()),
                        ),
                        title: Text(singlePost.title),
                        subtitle: Text(singlePost.body),
                      );
                    });
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
