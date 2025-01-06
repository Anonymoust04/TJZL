import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('web/icons/assets/images/dvolt_enhanced_white.png', height: 40),
            SizedBox(width: 10),
            Text('Profile'),
          ],
        ),
        backgroundColor: Colors.green.shade900,
      ),
      body: Center(
        child: Text('Profile Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}