import 'package:bibisit/pages/auth_page.dart';
import 'package:bibisit/pages/homepage.dart';
import 'package:bibisit/pages/login_page.dart';
import 'package:bibisit/pages/register_page.dart';
import 'package:bibisit/pages/splash_screen.dart';
import 'package:bibisit/pages/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() async {
    if (kIsWeb) {
      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    }
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bibisit',

      initialRoute: '/splashScreen', // Start with the LoginScreen
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/splashScreen': (context) => SplashScreen(),
        '/auth': (context) => AuthPage(),
        '/home': (context) => HomePage(),
        // Add routes for other screens here, e.g., '/dashboard', etc.
      },
    );
  }
}
