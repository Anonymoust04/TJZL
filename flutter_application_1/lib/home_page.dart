import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String firstName;
  final String lastName;

  HomePage({required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome, $firstName $lastName',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Spacer(), // Pushes the buttons to the center
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/donate');
              },
              child: Text('Donate', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60), // Full width and larger height
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 20), // Space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wallet');
              },
              child: Text('Wallet', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60), // Full width and larger height
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 20), // Space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Profile', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60), // Full width and larger height
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            Spacer(), // Pushes the logout button to the bottom
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Logout', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full width and slightly larger height
                padding: EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.red, // Red color for the logout button
              ),
            ),
          ],
        ),
      ),
    );
  }
}