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
    apiKey: 'AIzaSyC8iGLFgAeoR942Cwx8QCWxArhGAiFp7bw',
    appId: '1:894516929523:web:29bf7ba1e9367ec83da886',
    messagingSenderId: '894516929523',
    projectId: 'flutterapp-18186',
    authDomain: 'flutterapp-18186.firebaseapp.com',
    storageBucket: 'flutterapp-18186.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVsTWoQbdYTduB3HDtrXDuuAvR3YftwZ8',
    appId: '1:894516929523:android:6ba43da24b3f5a5f3da886',
    messagingSenderId: '894516929523',
    projectId: 'flutterapp-18186',
    storageBucket: 'flutterapp-18186.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfGyjkWFKuJGGdpiB0tRLps73h12wXjao',
    appId: '1:894516929523:ios:f8569dd098c7eb743da886',
    messagingSenderId: '894516929523',
    projectId: 'flutterapp-18186',
    storageBucket: 'flutterapp-18186.appspot.com',
    iosBundleId: 'com.example.other',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfGyjkWFKuJGGdpiB0tRLps73h12wXjao',
    appId: '1:894516929523:ios:f8569dd098c7eb743da886',
    messagingSenderId: '894516929523',
    projectId: 'flutterapp-18186',
    storageBucket: 'flutterapp-18186.appspot.com',
    iosBundleId: 'com.example.other',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC8iGLFgAeoR942Cwx8QCWxArhGAiFp7bw',
    appId: '1:894516929523:web:9b32533032c8016e3da886',
    messagingSenderId: '894516929523',
    projectId: 'flutterapp-18186',
    authDomain: 'flutterapp-18186.firebaseapp.com',
    storageBucket: 'flutterapp-18186.appspot.com',
  );
}
