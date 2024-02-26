import 'package:final_year_project/screens/auth_screen/login_screen.dart';
import 'package:final_year_project/screens/home_screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyArqlEXWSFLqk-COmoFEd9xbTeJunXZf-I",
          appId: "1:506182906477:android:eee817b81ccc9d1137c564",
          messagingSenderId: "506182906477",
          projectId: "fyp-01-a1800",
          storageBucket: "fyp-01-a1800.appspot.com"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FYP',
        theme: ThemeData(
          fontFamily: GoogleFonts.tenorSans().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified)
            ? const HomePage()
            : const LoginScreen());
  }
}
