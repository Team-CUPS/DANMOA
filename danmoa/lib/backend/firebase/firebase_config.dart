import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCdAr2UyjkiQKj4OEIvJlz_uYCiRlV3faM",
            authDomain: "danmoa-p5plsh.firebaseapp.com",
            projectId: "danmoa-p5plsh",
            storageBucket: "danmoa-p5plsh.appspot.com",
            messagingSenderId: "710255742889",
            appId: "1:710255742889:web:9a4d649b9ae9c2b333beb8"));
  } else {
    await Firebase.initializeApp();
  }
}
