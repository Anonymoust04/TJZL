import 'package:flutter/material.dart';

class TrackDonationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Donations'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Text('Track your donations and see progress here!'),
      ),
    );
  }
}
