import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ProposeLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('web/icons/assets/images/dvolt_enhanced_white.png', height: 40),
            SizedBox(width: 10),
            Text('Propose Location'),
          ],
        ),
        backgroundColor: Colors.green.shade900,
      ),
      body: Center(
        child: Text('Propose Location Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}