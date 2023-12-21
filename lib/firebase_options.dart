// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCZZaL2y7FZvuxye_pDjaiQHpZijfxNckU',
    appId: '1:14773156811:web:0540690ffb210e28a9d44e',
    messagingSenderId: '14773156811',
    projectId: 'transportkartan',
    authDomain: 'transportkartan.firebaseapp.com',
    storageBucket: 'transportkartan.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1GoO0lmj4ELVPebDQBOJf-soKBRbUcSY',
    appId: '1:14773156811:android:85311f8aecba516fa9d44e',
    messagingSenderId: '14773156811',
    projectId: 'transportkartan',
    storageBucket: 'transportkartan.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_07qjej-ImdRPWT6tiiBYMxbDP4hSo3A',
    appId: '1:14773156811:ios:5da7091606579c25a9d44e',
    messagingSenderId: '14773156811',
    projectId: 'transportkartan',
    storageBucket: 'transportkartan.appspot.com',
    iosBundleId: 'com.example.transportkartan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_07qjej-ImdRPWT6tiiBYMxbDP4hSo3A',
    appId: '1:14773156811:ios:e5b5b180ff528d63a9d44e',
    messagingSenderId: '14773156811',
    projectId: 'transportkartan',
    storageBucket: 'transportkartan.appspot.com',
    iosBundleId: 'com.example.transportkartan.RunnerTests',
  );
}
