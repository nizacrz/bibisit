import 'package:bibisit/pages/forgot_password_screen/forgot_password.dart';
import 'package:bibisit/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool emailValid = true; // Track email validation
  bool passwordValid = true; // Track password validation

  Future<void> signIn() async {
    setState(() {
      isLoading = true; // Start loading
    });

    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      // Handle empty email or password
      showSnackbar(context, 'Email and password are required.');
      setState(() {
        isLoading = false; // Stop loading
      });
    } else {
      // Perform login with validated credentials
      try {
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        final User? user = userCredential.user;

        if (user != null) {
          // Successfully signed in, navigate to the home page.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          // Handle user being null, show a generic error snackbar.
          showSnackbar(
              context, 'Incorrect email or password. Please try again.');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          showSnackbar(context, 'Invalid Login Credentials. Please try again.');
        } else {
          showSnackbar(context, 'An error occurred. Please try again.');
        }
      } finally {
        setState(() {
          isLoading = false; // Stop loading
        });
      }
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
                // Welcome back text
                Text(
                  'Welcome Back!',
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

                // Password field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    key: Key(
                        'passwordTextField'), // Add a key to access the TextField
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: passwordValid
                                ? Colors.pink.shade100
                                : Colors.red), // Update border color
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
                SizedBox(height: 25),

                // Forgot Password (wrapped with GestureDetector)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ForgotPasswordScreen()), // Navigate to ForgotPasswordScreen
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // Sign In Button with loading circle
                Stack(
                  children: [
                    GestureDetector(
                      onTap: isLoading ? null : signIn,
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
                            "Sign In",
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

                // Not a member, register now
// Not a member, register now
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Register now',
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
