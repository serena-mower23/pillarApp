import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDD0_tDnRqkk_9mcrmZgnfujnzT-Y60JEU",
            authDomain: "pillar2-8ee9e.firebaseapp.com",
            projectId: "pillar2-8ee9e",
            storageBucket: "pillar2-8ee9e.appspot.com",
            messagingSenderId: "744804378289",
            appId: "1:744804378289:web:115e8a2f143c56edd92490",
            measurementId: "G-P3EQQRSBMF"));
  } else {
    await Firebase.initializeApp();
  }
}
