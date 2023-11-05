import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bibisit/pages/login_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isLoading = false;
  bool emailValid = true; // Track email validation
  bool passwordValid = true; // Track password validation

  Future<void> register() async {
    setState(() {
      isLoading = true; // Start loading
    });

    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty) {
      // Handle empty email or password
      showSnackbar(context, 'Email and password are required.');
      setState(() {
        isLoading = false; // Stop loading
      });
      return;
    }

    if (password != confirmPassword) {
      // Handle password confirmation mismatch
      showSnackbar(context, 'Passwords do not match.');
      setState(() {
        isLoading = false; // Stop loading
      });
      return;
    }

    if (password.length < 6 || !containsSpecialCharacters(password)) {
      // Check if the password is less than 6 characters or lacks special characters
      showSnackbar(context,
          'Enter a combination of at least six numbers, letters and punctuation marks (like ! and &).');
      setState(() {
        isLoading = false; // Stop loading
      });
      return;
    }

    // Perform registration with validated credentials
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;

      if (user != null) {
        // Successfully registered, navigate to the home page.
        showSnackbar(context, 'Registration successful. Please log in.');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showSnackbar(context, 'Please enter a valid email address.');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(context, 'Email already exists.');
      } else {
        showSnackbar(context, 'Registration failed. Please try again.');
      }
    } finally {
      setState(() {
        isLoading = false; // Stop loading
      });
    }
  }

  // Function to show a snackbar with specific messages
  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  // Function to check if a password contains special characters
  bool containsSpecialCharacters(String password) {
    final specialCharacters = RegExp(r'[!@#%^&*()]');
    return specialCharacters.hasMatch(password);
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
                SizedBox(height: 20),

                // Register text
                Text(
                  'Create an Account',
                  style: TextStyle(
                    color: Colors.red[300],
                    fontSize: 35,
                    fontFamily: 'Cotane',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 15),

                // Email field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    key: Key('emailTextField'),
                    controller: emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: emailValid ? Colors.pink.shade100 : Colors.red,
                        ),
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

                // Password field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    key: Key('passwordTextField'),
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              passwordValid ? Colors.pink.shade100 : Colors.red,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink.shade200),
                      ),
                      fillColor: Colors.red.shade100,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Confirm Password field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    key: Key('confirmPasswordTextField'),
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              passwordValid ? Colors.pink.shade100 : Colors.red,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink.shade200),
                      ),
                      fillColor: Colors.red.shade100,
                      filled: true,
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Sign Up Button with loading circle
                Stack(
                  children: [
                    GestureDetector(
                      onTap: isLoading ? null : register,
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
                            "Sign Up",
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
                            Colors.blue.shade200,
                          ),
                        ),
                      ),
                  ],
                ),

                SizedBox(height: 15),

                // Divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Google sign-in button
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'assets/images/google.png',
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Already a member, sign in now
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Sign in now',
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
