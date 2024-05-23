import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDYlp17o-vvKHdeiH3DxY95U81ClJLcTsM",
            authDomain: "project-d92b4.firebaseapp.com",
            projectId: "project-d92b4",
            storageBucket: "project-d92b4.appspot.com",
            messagingSenderId: "777826229031",
            appId: "1:777826229031:web:fb58b02b5100a8b9a16702",
            measurementId: "G-3N2FE6F5YV"));
  } else {
    await Firebase.initializeApp();
  }
}
