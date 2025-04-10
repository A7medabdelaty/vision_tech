import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_tech/core/firebase_auth_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.firebaseAuthHelper) : super(AuthInitial());
  final FirebaseAuthHelper firebaseAuthHelper;

  Future<User?>? login({required String email, required String password}) {
    emit(AuthLoginLoading());
    try {
      final user = firebaseAuthHelper.signInWithEmail(email, password);
      emit(AuthLoginSuccess());
      return user;
    } catch (e) {
      emit(AuthLoginError());
      return null;
    }
  }

  Future<User?>? signUp({required String email, required String password}) {
    emit(AuthSignUpLoading());
    try {
      final user = firebaseAuthHelper.signUpWithEmail(email, password);
      emit(AuthSignUpSuccess());
      return user;
    } catch (e) {
      emit(AuthSignUpError());
      return null;
    }
  }

  Future<bool> resetPassword({required String email}) async {
    emit(AuthResetPasswordLoading());
    try {
      final result = await firebaseAuthHelper.resetPassword(email);
      emit(AuthResetPasswordSuccess());
      return result;
    } catch (e) {
      emit(AuthResetPasswordError());
      return false;
    }
  }
}
