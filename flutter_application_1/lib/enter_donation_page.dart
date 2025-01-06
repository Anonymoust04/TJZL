import 'package:flutter/material.dart';

class EnterDonationsPage extends StatelessWidget {
  final String projectName;

  EnterDonationsPage({required this.projectName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('web/icons/assets/images/dvolt_enhanced_white.png', height: 40),
            SizedBox(width: 10),
            Text('Enter Donation'),
          ],
        ),
        backgroundColor: Colors.green.shade900,
      ),
      body: Center(
        child: Text('Enter Donation Page for $projectName', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
