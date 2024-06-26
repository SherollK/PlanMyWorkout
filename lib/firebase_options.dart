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
    apiKey: 'AIzaSyAuIBh42ZTEZr_RFCxMJ4nbMMvAykgTWME',
    appId: '1:998241181100:web:327720e46388be03b42e09',
    messagingSenderId: '998241181100',
    projectId: 'plan-my-workout-d1ec6',
    authDomain: 'plan-my-workout-d1ec6.firebaseapp.com',
    storageBucket: 'plan-my-workout-d1ec6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCckKfR8khgY4ubCZ1Ropca4Z0GmSwIbBQ',
    appId: '1:998241181100:android:eb3f76d248368dcdb42e09',
    messagingSenderId: '998241181100',
    projectId: 'plan-my-workout-d1ec6',
    storageBucket: 'plan-my-workout-d1ec6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcP4P7rHeRyImkg_JUPow9yuvEHXzyTVE',
    appId: '1:998241181100:ios:5c056611b2604d73b42e09',
    messagingSenderId: '998241181100',
    projectId: 'plan-my-workout-d1ec6',
    storageBucket: 'plan-my-workout-d1ec6.appspot.com',
    iosBundleId: 'com.example.flutterApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcP4P7rHeRyImkg_JUPow9yuvEHXzyTVE',
    appId: '1:998241181100:ios:5c056611b2604d73b42e09',
    messagingSenderId: '998241181100',
    projectId: 'plan-my-workout-d1ec6',
    storageBucket: 'plan-my-workout-d1ec6.appspot.com',
    iosBundleId: 'com.example.flutterApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAuIBh42ZTEZr_RFCxMJ4nbMMvAykgTWME',
    appId: '1:998241181100:web:2bc60256230e3128b42e09',
    messagingSenderId: '998241181100',
    projectId: 'plan-my-workout-d1ec6',
    authDomain: 'plan-my-workout-d1ec6.firebaseapp.com',
    storageBucket: 'plan-my-workout-d1ec6.appspot.com',
  );

}