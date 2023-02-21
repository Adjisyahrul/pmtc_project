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
    apiKey: 'AIzaSyCmuYlwOutCtS04BEUv4t5t7CTH2Acvt68',
    appId: '1:1044237116428:web:f3a0dfefc9942d4b0a3a29',
    messagingSenderId: '1044237116428',
    projectId: 'flutter-ui-codelab-85779',
    authDomain: 'flutter-ui-codelab-85779.firebaseapp.com',
    storageBucket: 'flutter-ui-codelab-85779.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOoFBEaTwKpZmbcpXVgsRL5IP4iMJTDQA',
    appId: '1:1044237116428:android:fa754fecf5a0388f0a3a29',
    messagingSenderId: '1044237116428',
    projectId: 'flutter-ui-codelab-85779',
    storageBucket: 'flutter-ui-codelab-85779.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhRqyctLQQqXz4nPabmhwHTlkDLan8JYk',
    appId: '1:1044237116428:ios:c347ca732a7d795c0a3a29',
    messagingSenderId: '1044237116428',
    projectId: 'flutter-ui-codelab-85779',
    storageBucket: 'flutter-ui-codelab-85779.appspot.com',
    iosClientId: '1044237116428-glj26lisk1o5ul61nn9kckvmksgjb4u1.apps.googleusercontent.com',
    iosBundleId: 'com.example.pmtcProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhRqyctLQQqXz4nPabmhwHTlkDLan8JYk',
    appId: '1:1044237116428:ios:c347ca732a7d795c0a3a29',
    messagingSenderId: '1044237116428',
    projectId: 'flutter-ui-codelab-85779',
    storageBucket: 'flutter-ui-codelab-85779.appspot.com',
    iosClientId: '1044237116428-glj26lisk1o5ul61nn9kckvmksgjb4u1.apps.googleusercontent.com',
    iosBundleId: 'com.example.pmtcProject',
  );
}
