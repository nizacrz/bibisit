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
  final List<Widget> _pages = [
    HomePage(),
    ModulesPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
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
            label: 'Modules',
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
}
