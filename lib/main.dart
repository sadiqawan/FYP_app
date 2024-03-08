import 'package:final_year_project/provider_classes/favorite_provider.dart';
import 'package:final_year_project/screens/admin_screen/admin_dashboard.dart';
import 'package:final_year_project/screens/auth_screen/login_screen.dart';
import 'package:final_year_project/screens/home_screens/home_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyArqlEXWSFLqk-COmoFEd9xbTeJunXZf-I",
          appId: "1:506182906477:android:eee817b81ccc9d1137c564",
          messagingSenderId: "506182906477",
          projectId: "fyp-01-a1800",
          storageBucket: "fyp-01-a1800.appspot.com"));
  await PersistentShoppingCart().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        // Provider(create: (context) => FavoriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HiFashion',
        theme: ThemeData(
          fontFamily: GoogleFonts.tenorSans().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            }
            final user = snapshot.data;
            if (user != null && user.email == 'awansadiq09@gmail.com') {
              return const AdminDashboard();
            } else if (user != null && user.emailVerified) {
              return const HomeSplashScreen();
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
