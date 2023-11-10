import 'package:flutter/material.dart';

class SafetyBasicsScreen extends StatelessWidget {
  const SafetyBasicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Basics'),
      ),
      body: Center(
        child: Text('Safety Basics Content'),
      ),
    );
  }
}
