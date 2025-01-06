import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String firstName;
  final String lastName;

  HomePage({required this.firstName, required this.lastName});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          'Welcome, ${widget.firstName} ${widget.lastName}',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/donate');
                          },
                          child: Text('Donate', style: TextStyle(fontSize: 24)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 60),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.green.shade900,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/wallet');
                          },
                          child: Text('Wallet', style: TextStyle(fontSize: 24)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 60),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.green.shade900,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                          child: Text('Profile', style: TextStyle(fontSize: 24)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 60),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.green.shade900,
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text('Logout', style: TextStyle(fontSize: 20)),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            padding: EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ],
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