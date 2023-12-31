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
    apiKey: 'AIzaSyDQWbWzqNE_qQGPgiUs9yPW_GFE4RLRweo',
    appId: '1:585010189571:web:246dd55f22c915df2f8536',
    messagingSenderId: '585010189571',
    projectId: 'bibisit-91514',
    authDomain: 'bibisit-91514.firebaseapp.com',
    storageBucket: 'bibisit-91514.appspot.com',
    measurementId: 'G-XS5LKLYE9D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5F5T4238SsTJiF5zt-ilHoQEjtiXxUfE',
    appId: '1:585010189571:android:72b9697ce2f9bc572f8536',
    messagingSenderId: '585010189571',
    projectId: 'bibisit-91514',
    storageBucket: 'bibisit-91514.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCddBt5US67pTIJb-03cE3yJ0KjXrSiY1M',
    appId: '1:585010189571:ios:980cbb1559c288c22f8536',
    messagingSenderId: '585010189571',
    projectId: 'bibisit-91514',
    storageBucket: 'bibisit-91514.appspot.com',
    androidClientId: '585010189571-5e1hd926fnli1vj3b0bfkis2h40nrhv0.apps.googleusercontent.com',
    iosClientId: '585010189571-n1m9dg74puokid3h3l9o7ppsici264q6.apps.googleusercontent.com',
    iosBundleId: 'com.example.bibisit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCddBt5US67pTIJb-03cE3yJ0KjXrSiY1M',
    appId: '1:585010189571:ios:b5c4e5c496ca67462f8536',
    messagingSenderId: '585010189571',
    projectId: 'bibisit-91514',
    storageBucket: 'bibisit-91514.appspot.com',
    androidClientId: '585010189571-5e1hd926fnli1vj3b0bfkis2h40nrhv0.apps.googleusercontent.com',
    iosClientId: '585010189571-lco0ipe5j487spu3tn0vg6ifs9l3hu92.apps.googleusercontent.com',
    iosBundleId: 'com.example.bibisit.RunnerTests',
  );
}
