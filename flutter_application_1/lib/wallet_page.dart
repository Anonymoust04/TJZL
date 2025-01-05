import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Center(
        child: Text('Wallet Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}