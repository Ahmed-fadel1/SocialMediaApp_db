import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/services/core_auth_services.dart';
import 'package:social_media_app/features/auth/models/user_data.dart';
import 'package:social_media_app/features/home/models/post_model.dart';
import 'package:social_media_app/features/home/models/post_request_body.dart';
import 'package:social_media_app/features/home/models/story_model.dart';
import 'package:social_media_app/features/home/services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final homeServices = HomeServices();

  Future<void> fetchStories() async {
    emit(StoriesLoading());
    try {
      final stories = await homeServices.fetchStories();
      emit(StoriesLoaded(stories));
    } on Exception catch (e) {
      emit(StoriesError(e.toString()));
    }
  }

  Future<void> fetchPosts() async {
    emit(PostsLoading());
    try {
      final rawPosts = await homeServices.fetchPosts();
      List<PostModel> posts = [];
      for (var post in rawPosts) {
        final userData = await CoreAuthServices().getUserData(post.authorId);
        if (userData != null) {
          post = post.copyWith(
            authorName: userData.name,
            authorimageUrl: userData.imageUrl,
          );
        }
        posts.add(post);
      }
      emit(PostsLoaded(posts));
    } on Exception catch (e) {
      emit(PostsError(e.toString()));
    }
  }

  Future<void> createPost({required String text}) async {
    emit(PostCreating());

    try {
      final currentUser = await CoreAuthServices().getCurrentUserData();
      if (currentUser == null) {
        emit(PostsError('User is not authenticated'));
        return;
      }
      final post = PostRequestBody(text: text, authorId: currentUser.id);
      await homeServices.createPost(post);
      emit(PostCreated());
    } on Exception catch (e) {
      emit(PostCreationError(e.toString()));
    }
  }

  Future<UserData?> fetchInitalCreatePostData() async {
    emit(PostCreatingInitialLoading());
    try {
      final currentUser = await CoreAuthServices().getCurrentUserData();
      if (currentUser == null) {
        emit(PostCreationError('User is not authenticated'));
        return null;
      }
      emit(PostCreatingInitial(currentUser: currentUser));
    } on Exception catch (e) {
      emit(PostCreationError(e.toString()));
    }
  }

  Future<void> refresh() async {
    await fetchPosts();
    await fetchStories();
  }
}
