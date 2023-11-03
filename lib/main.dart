import 'package:bibisit/pages/login_page.dart';
import 'package:bibisit/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bibisit',
      theme: ThemeData(
        primaryColor: Colors.blue, // Customize the theme colors as needed
        hintColor: Colors.pink,
      ),
      initialRoute: '/login', // Start with the LoginScreen
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        // Add routes for other screens here, e.g., '/dashboard', etc.
      },
    );
  }
}
