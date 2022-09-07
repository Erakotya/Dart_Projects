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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD2TFt6JrAkWvavp1H4Mg4p4QYYxX_t8sw',
    appId: '1:1085435299186:web:ecf68fb7e04e9b370409eb',
    messagingSenderId: '1085435299186',
    projectId: 'flutter-chat-d435d',
    authDomain: 'flutter-chat-d435d.firebaseapp.com',
    databaseURL: 'https://flutter-chat-d435d-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-chat-d435d.appspot.com',
    measurementId: 'G-J90Q8X56F6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5I7VLIB1ydhAV2JTVcIWyMByL7rqfcjM',
    appId: '1:1085435299186:android:64f8e4781fbd335d0409eb',
    messagingSenderId: '1085435299186',
    projectId: 'flutter-chat-d435d',
    databaseURL: 'https://flutter-chat-d435d-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-chat-d435d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWjPMmZdbJgNy7KuszUkyOfy-fFPB2t-g',
    appId: '1:1085435299186:ios:56a9e13b9312d27f0409eb',
    messagingSenderId: '1085435299186',
    projectId: 'flutter-chat-d435d',
    databaseURL: 'https://flutter-chat-d435d-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-chat-d435d.appspot.com',
    iosClientId: '1085435299186-iukr37cil0sh39d92gt8urohisl2oggr.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
