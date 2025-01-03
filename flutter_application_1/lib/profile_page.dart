import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}