import 'package:bibisit/pages/edit_profile.dart';
import 'package:bibisit/pages/login_page.dart';
import 'package:bibisit/pages/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController _displayNameController = TextEditingController();

  Future<void> signOutFromGoogle() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  void signUserOut(BuildContext context) async {
    try {
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
    } catch (e) {
      print("Error signing out: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error signing out. Please try again."),
        ),
      );
    }
  }

  Future<void> _editProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfileScreen()),
    );

    if (result != null && result is String) {
      // Update the display name in your Firebase user profile or wherever you store it
      // This is just an example, you should replace it with your actual user data update logic
      setState(() {
        user.updateDisplayName(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle headerTextStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.red.shade300,
    );
    TextStyle infoTextStyle = TextStyle(
      fontSize: 16,
      color: Colors.red.shade300,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade300,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the homepage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: user.photoURL != null
                    ? NetworkImage(user.photoURL!)
                    : AssetImage('assets/images/default_profile_image.png')
                        as ImageProvider<Object>,
                radius: 50,
              ),
              SizedBox(height: 10),
              Text(
                "Welcome, ${user.displayName ?? 'Trainee User'}!",
                style: headerTextStyle,
              ),
              SizedBox(height: 20),
              Text(
                "Email: ${user.email!}",
                style: infoTextStyle,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _editProfile,
                child: Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  primary: Colors.red.shade300,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => signUserOut(context),
                child: Text(
                  "Sign Out",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  primary: Colors.red.shade300,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
