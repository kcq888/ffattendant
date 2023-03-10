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
    apiKey: 'AIzaSyAbeJP0_uAJIo3LiSR-Xd3OUd2bVw0YIfs',
    appId: '1:361698027401:web:75ecd8e9e68ede453d2358',
    messagingSenderId: '361698027401',
    projectId: 'attendant-b4459',
    authDomain: 'attendant-b4459.firebaseapp.com',
    storageBucket: 'attendant-b4459.appspot.com',
    measurementId: 'G-2NDT9CT44Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-BHqINnGcKTpu0kpA-DURzlcQXbSxKy0',
    appId: '1:361698027401:android:21a95eb70217db523d2358',
    messagingSenderId: '361698027401',
    projectId: 'attendant-b4459',
    storageBucket: 'attendant-b4459.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3-I-WhP7av5w5mPIKIufLpujX__uAq70',
    appId: '1:361698027401:ios:0672a446113592123d2358',
    messagingSenderId: '361698027401',
    projectId: 'attendant-b4459',
    storageBucket: 'attendant-b4459.appspot.com',
    iosClientId: '361698027401-cnutc2lug0fo15eh1i54ng2loqbkjipb.apps.googleusercontent.com',
    iosBundleId: 'com.example.ftt151attendant',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3-I-WhP7av5w5mPIKIufLpujX__uAq70',
    appId: '1:361698027401:ios:0672a446113592123d2358',
    messagingSenderId: '361698027401',
    projectId: 'attendant-b4459',
    storageBucket: 'attendant-b4459.appspot.com',
    iosClientId: '361698027401-cnutc2lug0fo15eh1i54ng2loqbkjipb.apps.googleusercontent.com',
    iosBundleId: 'com.example.ftt151attendant',
  );
}
