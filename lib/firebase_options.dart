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
    apiKey: 'AIzaSyCQJL7RPAfVLkEh8w4OIzSi3SZwBaPPcQ4',
    appId: '1:760692346278:web:d0a546ab3010f9ae381367',
    messagingSenderId: '760692346278',
    projectId: 'fir-25865',
    authDomain: 'fir-25865.firebaseapp.com',
    storageBucket: 'fir-25865.appspot.com',
    measurementId: 'G-57TLR8HC1K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVhXMQsmXUW5BZAvPiwD8d58v6bn-4Pts',
    appId: '1:760692346278:android:559004f581e24966381367',
    messagingSenderId: '760692346278',
    projectId: 'fir-25865',
    storageBucket: 'fir-25865.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZWwXmZJFLIiFiBTAYrJq-eE2IllXfAuI',
    appId: '1:760692346278:ios:2231a1d329534626381367',
    messagingSenderId: '760692346278',
    projectId: 'fir-25865',
    storageBucket: 'fir-25865.appspot.com',
    iosBundleId: 'com.example.firebaseProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZWwXmZJFLIiFiBTAYrJq-eE2IllXfAuI',
    appId: '1:760692346278:ios:2231a1d329534626381367',
    messagingSenderId: '760692346278',
    projectId: 'fir-25865',
    storageBucket: 'fir-25865.appspot.com',
    iosBundleId: 'com.example.firebaseProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCQJL7RPAfVLkEh8w4OIzSi3SZwBaPPcQ4',
    appId: '1:760692346278:web:398d8d2dcf3a65cd381367',
    messagingSenderId: '760692346278',
    projectId: 'fir-25865',
    authDomain: 'fir-25865.firebaseapp.com',
    storageBucket: 'fir-25865.appspot.com',
    measurementId: 'G-X0PWYQMH86',
  );
}
