import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAY4urxh-n57qsb1zJWJ6F-EjGilnfC_Wg",
            authDomain: "mentoria--level-up.firebaseapp.com",
            projectId: "mentoria--level-up",
            storageBucket: "mentoria--level-up.appspot.com",
            messagingSenderId: "777211950858",
            appId: "1:777211950858:web:519d1e789103605513acf3",
            measurementId: "G-4Q2XRDSL4S"));
  } else {
    await Firebase.initializeApp();
  }
}
