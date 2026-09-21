// File generated for FlutterFire.
// ignore_for_file: type=lint
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAeThATu2OYPCDnWSm1lVs_mewEyN5E6a8',
    appId: '1:193423764067:web:005683884f3fc124e52656',
    messagingSenderId: '193423764067',
    projectId: 'nouman-knop',
    authDomain: 'nouman-knop.firebaseapp.com',
    storageBucket: 'nouman-knop.firebasestorage.app',
    measurementId: 'G-D4C1R0G8W1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpxiEoiR135AJDiqFWuq-O2zQn7FRfQMs',
    appId: '1:193423764067:android:7257e0fd23be62e3e52656',
    messagingSenderId: '193423764067',
    projectId: 'nouman-knop',
    storageBucket: 'nouman-knop.firebasestorage.app',
  );
}
