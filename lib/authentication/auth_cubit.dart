import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/authentication/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial()) {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          emit(const AuthState.loggedOut());
        } else {
          emit(AuthState.loggedIn(user));
        }
      });
    } catch (e) {
      emit(AuthState.failure(e));
    }
  }
}
