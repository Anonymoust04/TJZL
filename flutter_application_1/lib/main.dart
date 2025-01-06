import 'package:flutter/material.dart';
import 'login_page.dart';
import 'donate_page.dart';
import 'enter_donation_page.dart';
import 'wallet_page.dart';
import 'profile_page.dart';
import 'home_page.dart';
import 'sign_up_page.dart';
import 'screens/task_list_page.dart';
import 'screens/create_task_page.dart';
import 'propose_location_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EV Charger Donation DApp',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green.shade900,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade900,
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(firstName: 'John', lastName: 'Doe'), // Provide default values for demonstration
        '/donate': (context) => DonatePage(),
        '/enter_donation': (context) => EnterDonationsPage(projectName: 'Default Project'),
        '/wallet': (context) => WalletPage(),
        '/profile': (context) => ProfilePage(),
        '/signup': (context) => SignUpPage(),
        '/tasks': (context) => TaskListPage(),
        '/create_task': (context) => CreateTaskPage(),
        '/propose_location': (context) => ProposeLocationPage(),
      },
    );
  }
}

// wallet_page.dart
class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wallet')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Wallet Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// profile_page.dart
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// notification_page.dart
class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notifications Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// Animation example integrated into the button
Widget animatedButton(BuildContext context, String label, String route) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, route);
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}
