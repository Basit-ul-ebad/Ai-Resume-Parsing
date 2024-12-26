import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;
import './ui/Splash%20Screen/mt_splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Platform check for Firebase initialization
  if (kIsWeb) {
    // Initialize Firebase for Web
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB8I7OnQKHZ4NcpiK8vHynXZ0XpW94MVfw",
        authDomain: "ai-resume-parsing.firebaseapp.com",
        projectId: "ai-resume-parsing",
        storageBucket: "ai-resume-parsing.firebasestorage.app",
        messagingSenderId: "512956723939",
        appId: "1:512956723939:android:f4ab1aedbd0157fff38bd6",
      ),
    );
  } else if (Platform.isAndroid || Platform.isIOS) {
    // Initialize Firebase for Mobile (iOS/Android)
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme.apply(),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
