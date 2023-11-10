import 'package:bibisit/pages/screens/babysitter_profile.dart';
import 'package:bibisit/pages/screens/babysitting_tutorials.dart';
import 'package:bibisit/pages/screens/homepage.dart';
import 'package:flutter/material.dart';

class BottomTabNavigation extends StatefulWidget {
  @override
  State<BottomTabNavigation> createState() => _BottomTabNavigationState();
}

class _BottomTabNavigationState extends State<BottomTabNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red.shade300,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Aptitude Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return BabysittingAptitudeTest();
      case 2:
        return UserPage();
      default:
        return Container(); // Return a default screen if needed
    }
  }
}
