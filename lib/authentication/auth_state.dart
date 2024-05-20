import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitialState;
  const factory AuthState.loggedOut() = AuthLoggedOut;
  const factory AuthState.loggedIn(User user) = AuthLoggedIn;
  const factory AuthState.failure(dynamic error) = AuthFailure;
}
