import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDrPEvj-jhGENIrSCKBEhj54ILgU59gvcg",
            authDomain: "login-cebdd.firebaseapp.com",
            projectId: "login-cebdd",
            storageBucket: "login-cebdd.appspot.com",
            messagingSenderId: "801279714721",
            appId: "1:801279714721:web:7df5c94184f5bc775957e0"));
  } else {
    await Firebase.initializeApp();
  }
}
