import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  bool emailValid = true; // Track email validation

  Future<void> resetPassword() async {
    setState(() {
      isLoading = true; // Start loading
    });

    final email = emailController.text;

    if (email.isEmpty) {
      // Handle empty email
      showSnackbar(
          context, 'Please enter your email address to reset your password.');
      setState(() {
        isLoading = false; // Stop loading
      });
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      showSnackbar(context, 'Password reset email sent. Check your inbox.');
    } catch (e) {
      showSnackbar(context, 'Password reset failed. Please try again.');
    } finally {
      setState(() {
        isLoading = false; // Stop loading
      });
    }
  }

  // Function to show a snackbar
  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE1E1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Center(
                  child: Image.asset(
                    "assets/images/Logo.png",
                    width: 200,
                  ),
                ),
                SizedBox(height: 30),

                // Forgot Password text
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.red[300],
                    fontSize: 35,
                    fontFamily: 'Cotane',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 25),

                // Email field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    key: Key(
                        'emailTextField'), // Add a key to access the TextField
                    controller: emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: emailValid
                                ? Colors.pink.shade100
                                : Colors.red), // Update border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink.shade200),
                      ),
                      fillColor: Colors.red.shade100,
                      filled: true,
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // Reset Password Button with loading circle
                Stack(
                  children: [
                    GestureDetector(
                      onTap: isLoading ? null : resetPassword,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: isLoading
                              ? Colors.red.shade300
                              : Colors.red.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (isLoading)
                      Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.red.shade200),
                        ),
                      ),
                  ],
                ),

                SizedBox(height: 25),

                // Cancel
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
