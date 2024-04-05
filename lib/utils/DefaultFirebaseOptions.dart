import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyA5ngE7N9F0VTJbm2dD4MpVwHwW2fGQeDE",
      authDomain: "aastha-26950.firebaseapp.com",
      projectId: "aastha-26950",
      storageBucket: "aastha-26950.appspot.com",
      messagingSenderId: "962165694045",
      appId: "1:962165694045:web:4a820b25c56e8723d0f7b4"
  );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyA5ngE7N9F0VTJbm2dD4MpVwHwW2fGQeDE",
      authDomain: "aastha-26950.firebaseapp.com",
      projectId: "aastha-26950",
      storageBucket: "aastha-26950.appspot.com",
      messagingSenderId: "962165694045",
      appId: "1:962165694045:web:4a820b25c56e8723d0f7b4"
  );

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyA5ngE7N9F0VTJbm2dD4MpVwHwW2fGQeDE",
      authDomain: "aastha-26950.firebaseapp.com",
      projectId: "aastha-26950",
      storageBucket: "aastha-26950.appspot.com",
      messagingSenderId: "962165694045",
      appId: "1:962165694045:web:4a820b25c56e8723d0f7b4"
  );

}
