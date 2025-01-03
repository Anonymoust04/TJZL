import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileOption(
              context,
              icon: Icons.person,
              title: 'Username',
              subtitle: 'User123', // This will be dynamically set later
              onTap: () {
                // Handle username tap
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.phone,
              title: 'Phone Number',
              subtitle: '123-456-7890',
              onTap: () {
                // Handle phone number tap
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.email,
              title: 'Email Address',
              subtitle: 'user@example.com',
              onTap: () {
                // Handle email address tap
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.security,
              title: 'Security',
              onTap: () {
                // Handle security tap
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                // Navigate back to the login page
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, {required IconData icon, required String title, String? subtitle, required VoidCallback onTap}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.green.shade700, width: 2),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle) : null,
        onTap: onTap,
      ),
    );
  }
}