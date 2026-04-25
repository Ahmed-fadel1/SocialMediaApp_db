import 'package:social_media_app/core/services/supabase_services.dart';
import 'package:social_media_app/core/utils/app_tables_names.dart';
import 'package:social_media_app/features/home/models/post_model.dart';
import 'package:social_media_app/features/home/models/post_request_body.dart';
import 'package:social_media_app/features/home/models/story_model.dart';

class HomeServices {
  final supabaseDatabaseServices = SupabaseDatabaseServices.instance;

  Future<List<StoryModel>> fetchStories() async {
    try {
      return await supabaseDatabaseServices.fetchRows(
        table: 'stories',
        builder: (data, id) => StoryModel.fromMap(data),
        primaryKey: "id",
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<List<PostModel>> fetchPosts() async {
    try {
      final posts = await supabaseDatabaseServices.fetchRows(
        table: AppTablesNames.posts,
        builder: (data, id) => PostModel.fromMap(data),
        primaryKey: "id",
      );
      return posts;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<void> createPost(PostRequestBody post) async {
    try {
      await supabaseDatabaseServices.insertRow(
        table: AppTablesNames.posts,
        values: post.toMap(),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }
}
