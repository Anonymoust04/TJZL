import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'home_page.dart'; // Ensure HomePage is imported

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 20).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Map<String, String>?> _validateUser(String username, String password) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/users.txt');
    if (await file.exists()) {
      final lines = await file.readAsLines();
      for (var line in lines) {
        final parts = line.split(',');
        if (parts.length == 5 && parts[2] == username && parts[4] == password) {
          return {'firstName': parts[0], 'lastName': parts[1]};
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height / 2,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _animation.value),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'web/icons/assets/images/dvolt_enhanced_white.png',
                              height: MediaQuery.of(context).size.height / 3,
                              fit: BoxFit.contain,
                              // Remove color and colorBlendMode to show the original logo
                            ),
                            SizedBox(height: 10),
                            Text(
                              'DVolt',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.white,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.green.shade900,
                    toolbarHeight: 0, // Hide the default AppBar height
                  ),
                  body: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.green.shade700,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Welcome Back!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              final userData = await _validateUser(_usernameController.text, _passwordController.text);
                              if (userData != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(
                                      firstName: userData['firstName']!,
                                      lastName: userData['lastName']!,
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Invalid username or password')),
                                );
                              }
                            },
                            child: Text('Login'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade900,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text('Don\'t have an account? Sign up'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
