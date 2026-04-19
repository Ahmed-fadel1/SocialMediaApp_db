import 'package:social_media_app/features/auth/models/user_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> signInWithEmail(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      if (response.user == null) {
        throw Exception('Failed to sign up');
      }
      await _setUserData(name, email, response.user!.id);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _setUserData(String name, String email, String userId) async {
    final userData = UserData(id: userId, name: name, email: email);
    try {
      await supabase.from("users").insert({
        'name': name,
        'email': email,
        'id': userId,
      });
      print("User inserted successfully!");
    } catch (e) {
      print("Error inserting user: $e");
    }
  }
}
