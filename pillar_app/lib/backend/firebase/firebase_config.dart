import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBx4NQScN0waQKqwiP8WKlWKUw0VODh_Ys",
            authDomain: "pillartest-951cb.firebaseapp.com",
            projectId: "pillartest-951cb",
            storageBucket: "pillartest-951cb.appspot.com",
            messagingSenderId: "755117112276",
            appId: "1:755117112276:web:25a18d2ae360e287827441",
            measurementId: "G-BR35XBGCXD"));
  } else {
    await Firebase.initializeApp();
  }
}
