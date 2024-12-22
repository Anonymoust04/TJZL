import 'package:flutter/material.dart';

class TrackDonationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Donations'),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          DonationStatusCard(
            projectName: 'Tesla EV Charger',
            amountDonated: 5000,
            totalRequired: 70000,
            isDividendEligible: true,
          ),
          DonationStatusCard(
            projectName: 'BYD EV Charger',
            amountDonated: 1000,
            totalRequired: 8000,
            isDividendEligible: false,
          ),
        ],
      ),
    );
  }
}
