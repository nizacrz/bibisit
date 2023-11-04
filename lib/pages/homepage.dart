import 'package:bibisit/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  // Sign user out method
  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    // Navigate back to the login screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
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
        child: Text("Taffy Logged in as: " + user.email!),
      ),
    );
  }
}
