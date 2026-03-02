import 'package:bloc/bloc.dart';
import 'package:social_media_app/features/auth/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authservice = AuthService();

  Future<void> signin(String email, String password) async {
    try {
      emit(AuthLoading());
      await authservice.signInWithEmail(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFaliure(e.toString()));
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      emit(AuthLoading());
      await authservice.signUpWithEmail(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFaliure(e.toString()));
    }
  }

  Future<void> signout() async {
    try {
      emit(AuthLoading());
      await authservice.signOut();
      emit(AuthLogout());
    } catch (e) {
      emit(AuthFaliure(e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      emit(AuthLoading());
      await authservice.resetPassword(email);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFaliure(e.toString()));
    }
  }
}
