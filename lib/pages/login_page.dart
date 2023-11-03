// ignore_for_file: prefer_const_constructors

import 'package:bibisit/components/my_button.dart';
import 'package:bibisit/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE1E1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // Wrap with SingleChildScrollView to handle overflow
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  child: Image.asset(
                    "assets/images/Logo.png",
                    width: 200,
                  ),
                ),

                SizedBox(height: 30),

                //Welcome back text
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

                //Username field

                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                SizedBox(height: 25),

                //Password field
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                SizedBox(height: 25),

                //Forgot Password

                Padding(
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

                SizedBox(height: 25),

                MyButton(onTap: signUserIn),

                SizedBox(height: 25), // Reduced the SizedBox height

                //Divider

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
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
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Google sign-in button
                Center(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the row horizontally
                    children: [
                      // Google button
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
                const SizedBox(height: 25),
                //Not a member, register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
