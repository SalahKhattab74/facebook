import 'package:bloc/bloc.dart';
import 'package:facebook/data/data.dart';
import 'package:facebook/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Post> fetchedPosts = [];

  Future<void> getData() async {
    emit(AppLoadingData());
    await Future.delayed(const Duration(milliseconds: 2000), () {})
        .then((value) {

      fetchedPosts = List.from(posts);

    });

    emit(AppSuccsessData());
  }
}
