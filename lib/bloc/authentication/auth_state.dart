import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/models/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loggedOut() = AuthStateLoggedOut;
  const factory AuthState.loggedIn(UserModel user) = AuthStateLoggedIn;
  const factory AuthState.failure(dynamic error) = AuthStateFailure;
}
