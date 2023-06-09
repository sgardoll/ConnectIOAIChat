import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAtJxxOpx7AkrNukRErnkf2x3NW_t125f8",
            authDomain: "connect-io-ai-chat.firebaseapp.com",
            projectId: "connect-io-ai-chat",
            storageBucket: "connect-io-ai-chat.appspot.com",
            messagingSenderId: "100008295767",
            appId: "1:100008295767:web:5964a7cf29be913e0f5212",
            measurementId: "G-91GXJDXLG1"));
  } else {
    await Firebase.initializeApp();
  }
}
