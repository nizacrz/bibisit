import 'package:bibisit/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text("Taffy Logged ins as: " + user.email!),
      ),
    );
  }
}
