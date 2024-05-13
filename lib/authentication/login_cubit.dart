import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:transportkartan/authentication/login_state.dart';
import 'package:transportkartan/data/models/formz_models.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(state.copyWith(email: email, status: FormzSubmissionStatus.inProgress));
  }

  bool passwordChanged(String value) {
    final password = PasswordInput.dirty(value);

    password.isValid
        ? emit(state.copyWith(status: FormzSubmissionStatus.success))
        : emit(state.copyWith(status: FormzSubmissionStatus.failure));

   return password.isValid;
  }

  // Future<void> performLogin(String provider, List<String> scopes, Map<String, String> parameters) async {
  //   try {
  //     await FirebaseAuthOAuth().openSignInFlow(provider, scopes, parameters);
  //   } on PlatformException catch (error) {
  //     emit(state.copyWith(exceptionError: error.toString()));
  //   }
  // }

  Future<void> logInWithCredentials() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: state.email.value, password: state.password.value);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure, exceptionError: '${e.message}'));
    }
  }

  // Future signInWithGithub() async {
  //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
  //   try {
  //     await performLogin("github.com", ["user:email"], {"lang": "en"});
  //     emit(state.copyWith(status: FormzStatus.submissionSuccess));
  //   } on FirebaseAuthException catch (e) {
  //     emit(state.copyWith(status: FormzStatus.submissionFailure, exceptionError: e.message));
  //   }
  // }
}
