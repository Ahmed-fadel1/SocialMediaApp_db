import 'package:social_media_app/core/services/supabase_services.dart';
import 'package:social_media_app/core/utils/app_tables_names.dart';
import 'package:social_media_app/features/auth/models/user_data.dart';

class CoreAuthServices {
  Future<UserData?> getUserData(String userId) async {
    final supabaseDatabaseServices = SupabaseDatabaseServices.instance;
    try {
      supabaseDatabaseServices.fetchRow(
        table: AppTablesNames.users,
        primaryKey: "id",
        id: userId,
        builder: (data, id) => UserData.fromMap(data),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }
}
