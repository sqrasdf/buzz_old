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
    apiKey: 'AIzaSyBB65tOnBnQiO7S6oSjVPgUvbSGHABshuA',
    appId: '1:728649701656:web:714afc2fbad107bc9ca66d',
    messagingSenderId: '728649701656',
    projectId: 'buzz-c4165',
    authDomain: 'buzz-c4165.firebaseapp.com',
    storageBucket: 'buzz-c4165.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsl1ogRNOUq-pcjeGutwLlkK7sq2pndUs',
    appId: '1:728649701656:android:fb3fa2aed5ecb5919ca66d',
    messagingSenderId: '728649701656',
    projectId: 'buzz-c4165',
    storageBucket: 'buzz-c4165.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB98gwdAwqL46UHx9r8j9OVVY0Sd-8jJ7s',
    appId: '1:728649701656:ios:2531fc5704511bdc9ca66d',
    messagingSenderId: '728649701656',
    projectId: 'buzz-c4165',
    storageBucket: 'buzz-c4165.appspot.com',
    iosClientId: '728649701656-3cloogee6qmkvn6i8nq0vfdedu55n6tt.apps.googleusercontent.com',
    iosBundleId: 'com.example.buzz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB98gwdAwqL46UHx9r8j9OVVY0Sd-8jJ7s',
    appId: '1:728649701656:ios:2531fc5704511bdc9ca66d',
    messagingSenderId: '728649701656',
    projectId: 'buzz-c4165',
    storageBucket: 'buzz-c4165.appspot.com',
    iosClientId: '728649701656-3cloogee6qmkvn6i8nq0vfdedu55n6tt.apps.googleusercontent.com',
    iosBundleId: 'com.example.buzz',
  );
}