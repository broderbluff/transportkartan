import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/authentication/auth_state.dart';
import 'package:transportkartan/data/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(const AuthState.initial()) {
    try {
      _auth.authStateChanges().listen((User? user) async {
        if (user == null) {
          emit(const AuthState.loggedOut());
        } else {
          DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
          if (doc.exists) {
            // Use the data
            UserModel userData = UserModel.fromJson(doc.data() as Map<String, dynamic>);
            // Emit the state with the user data
            emit(AuthState.loggedIn(userData));
          } else {
            print('ERROR');
          }
        }
      });
    } catch (e) {
      emit(AuthState.failure(e));
    }
  }

  UserModel? get currentUser {
    final state = this.state;
    if (state is AuthStateLoggedIn) {
      return state.user;
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      emit(const AuthState.loggedOut());
    } catch (e) {
      emit(AuthState.failure(e));
    }
  }
}
