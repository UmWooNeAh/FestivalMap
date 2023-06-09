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
    apiKey: 'AIzaSyCXwCudphww2aducat_EvPWsCA01kp8A5w',
    appId: '1:156423571659:web:c5d7eb7deed7f20401734e',
    messagingSenderId: '156423571659',
    projectId: 'festivemap',
    authDomain: 'festivemap.firebaseapp.com',
    storageBucket: 'festivemap.appspot.com',
    measurementId: 'G-B8P9H5FXND',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnZUJ-7kzFjQNzw9WO3Ff5HxANFo161iQ',
    appId: '1:156423571659:android:20f7aacc058e862301734e',
    messagingSenderId: '156423571659',
    projectId: 'festivemap',
    storageBucket: 'festivemap.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGqtXwJ12X_Z8WMj78nT2Ib27tNUjKV60',
    appId: '1:156423571659:ios:5b94c5ec5993218101734e',
    messagingSenderId: '156423571659',
    projectId: 'festivemap',
    storageBucket: 'festivemap.appspot.com',
    iosClientId: '156423571659-n9llagt0hqa65odp5ku59q847t9v92b9.apps.googleusercontent.com',
    iosBundleId: 'com.example.festivalmap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGqtXwJ12X_Z8WMj78nT2Ib27tNUjKV60',
    appId: '1:156423571659:ios:5b94c5ec5993218101734e',
    messagingSenderId: '156423571659',
    projectId: 'festivemap',
    storageBucket: 'festivemap.appspot.com',
    iosClientId: '156423571659-n9llagt0hqa65odp5ku59q847t9v92b9.apps.googleusercontent.com',
    iosBundleId: 'com.example.festivalmap',
  );
}
