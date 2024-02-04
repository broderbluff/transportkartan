import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/models/formz_models.dart';

part 'login_state.freezed.dart'; // Added this line

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial(
      {@Default(EmailInput.pure()) EmailInput email,
      @Default(PasswordInput.pure()) PasswordInput password,
      @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
      @Default('') String exceptionError}) = _Initial;

  const LoginState._(); // Added this line
}
