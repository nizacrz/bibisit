import 'package:flutter/material.dart';

class FirstAidScreen extends StatelessWidget {
  const FirstAidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid'),
      ),
      body: Center(
        child: Text('First Aid Content'),
      ),
    );
  }
}
