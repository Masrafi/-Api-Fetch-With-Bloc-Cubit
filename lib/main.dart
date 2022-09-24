import 'package:bloc_data_get/cubit/post_fetch_cubit.dart';
import 'package:bloc_data_get/reposutory/api_repository.dart';
import 'package:bloc_data_get/service/api_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);

  // This widget is the root of your application.
  final ApiService apiService;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostFetchCubit>(
          create: (context) => PostFetchCubit(
            apiRepository: ApiReposityry(
              apiServicec: apiService,
            ),
          )..fetchPostApi(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
