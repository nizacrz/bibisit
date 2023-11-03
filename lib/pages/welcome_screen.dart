// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:bibisit/constants/fonts_strings.dart';
// import 'package:bibisit/constants/image_strings.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFE1E1),
        child: Center(
          child: Column(
            children: [
              //First Column
              Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Image.asset(
                  "assets/images/welcome_banner.png",
                  width: 412,
                ),
              ),

              //Second Column
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Image.asset(
                  "assets/images/LogoWithDesc.png",
                  width: 412,
                ),
              ),

              //Third Column
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 60),
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    ' Start your \n babysitting journey \n with us!',
                    style: TextStyle(
                      fontFamily: 'Orelega',
                      fontSize: 35,
                      fontWeight: FontWeight.normal,
                      color: Colors.pink[200],
                    ),
                  ),
                ),
              ),

// Fourth Column
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[300],
                  ),
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Button Press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[300],
                        foregroundColor: Colors.pink[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      child: RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.play_arrow,
                              size: 18,
                            ),
                          ),
                          TextSpan(
                            text: ' Get Started ',
                            style: TextStyle(
                              color: Colors.pink[400],
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
