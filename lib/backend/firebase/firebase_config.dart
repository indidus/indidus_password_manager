import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyADw-lBeQsmSB6K6cVnWOdyhL2O-gmCybg",
            authDomain: "indidus-password-manager.firebaseapp.com",
            projectId: "indidus-password-manager",
            storageBucket: "indidus-password-manager.appspot.com",
            messagingSenderId: "867001464038",
            appId: "1:867001464038:web:8f14ea87eecac31909b727",
            measurementId: "G-FYTR6MS5C9"));
  } else {
    await Firebase.initializeApp();
  }
}
