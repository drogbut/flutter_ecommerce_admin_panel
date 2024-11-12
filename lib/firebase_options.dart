import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBvrjF0JFpDBOBuqMaWJxfo0nz9hTBO3-8',
    appId: '1:813626309566:web:3aef887c97fe341fe297ef',
    messagingSenderId: '813626309566',
    projectId: 'flutter-folders-struture',
    authDomain: 'flutter-folders-struture.firebaseapp.com',
    storageBucket: 'flutter-folders-struture.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1mTtJBMvyTIwA6NrS6lQhnUkTC8uw5gM',
    appId: '1:813626309566:android:7b2a4c46aa7d8501e297ef',
    messagingSenderId: '813626309566',
    projectId: 'flutter-folders-struture',
    storageBucket: 'flutter-folders-struture.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1lG3KJBU2strgcLc_cCF20K2B0rjcR_o',
    appId: '1:813626309566:ios:794ce3d681778b2be297ef',
    messagingSenderId: '813626309566',
    projectId: 'flutter-folders-struture',
    storageBucket: 'flutter-folders-struture.appspot.com',
    iosClientId: '813626309566-rlcpni1580i2mackilgb8drrf0jddahg.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEcommerceAdminPanel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1lG3KJBU2strgcLc_cCF20K2B0rjcR_o',
    appId: '1:813626309566:ios:794ce3d681778b2be297ef',
    messagingSenderId: '813626309566',
    projectId: 'flutter-folders-struture',
    storageBucket: 'flutter-folders-struture.appspot.com',
    iosClientId: '813626309566-rlcpni1580i2mackilgb8drrf0jddahg.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEcommerceAdminPanel',
  );

}