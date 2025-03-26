// File generated by FlutterFire CLI.
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
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCOyHv4MF5TketaD0LWaYQX2s5BF1dqQtI',
    appId: '1:704407510729:web:1b50043632041584dc3718',
    messagingSenderId: '704407510729',
    projectId: 'crud-db882',
    authDomain: 'crud-db882.firebaseapp.com',
    storageBucket: 'crud-db882.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx67ZXJ4impEVf5SuvZMHKHZqmjgNnrzg',
    appId: '1:704407510729:android:76af71253b8f69d0dc3718',
    messagingSenderId: '704407510729',
    projectId: 'crud-db882',
    storageBucket: 'crud-db882.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJBHt3Xh4s5Y5nKI4J2GzL0EALROIDwM8',
    appId: '1:704407510729:ios:2bd7a97c04dbf6a7dc3718',
    messagingSenderId: '704407510729',
    projectId: 'crud-db882',
    storageBucket: 'crud-db882.firebasestorage.app',
    androidClientId: '704407510729-n2g6ri1i7apfligh1sr4gmubvmaip4aq.apps.googleusercontent.com',
    iosBundleId: 'com.example.supabaseCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJBHt3Xh4s5Y5nKI4J2GzL0EALROIDwM8',
    appId: '1:704407510729:ios:2bd7a97c04dbf6a7dc3718',
    messagingSenderId: '704407510729',
    projectId: 'crud-db882',
    storageBucket: 'crud-db882.firebasestorage.app',
    androidClientId: '704407510729-n2g6ri1i7apfligh1sr4gmubvmaip4aq.apps.googleusercontent.com',
    iosBundleId: 'com.example.supabaseCrud',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCOyHv4MF5TketaD0LWaYQX2s5BF1dqQtI',
    appId: '1:704407510729:web:2907ba4330d4bd13dc3718',
    messagingSenderId: '704407510729',
    projectId: 'crud-db882',
    authDomain: 'crud-db882.firebaseapp.com',
    storageBucket: 'crud-db882.firebasestorage.app',
  );
}
