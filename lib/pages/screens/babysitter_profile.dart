import 'package:bibisit/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  Future<void> signOutFromGoogle() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  // Sign user out method
  void signUserOut(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await signOutFromGoogle(); // Sign out from Google
      await FirebaseAuth.instance.signOut(); // Sign out from Firebase
      // Navigate back to the login screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      print("No user is currently signed in.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome, ${user.displayName ?? 'User'}!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Email: ${user.email!}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Add any additional user information you want to display

            // Add a sign-out button if needed
            ElevatedButton(
              onPressed: () => signUserOut(context),
              child: Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
