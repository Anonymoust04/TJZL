import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for TextInputType
import '../services/wallet_service.dart'; // Use relative path

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final WalletService walletService = WalletService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();
  final TextEditingController _walletAddressController = TextEditingController();
  bool _walletCreatedOrConnected = false;
  String _walletAddress = '';
  double _walletBalance = 0.0;

  Future<void> _createWallet() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }
    if (_pinController.text != _confirmPinController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PINs do not match')),
      );
      return;
    }
    try {
      final wallet = await walletService.createWallet(
        _usernameController.text,
        _passwordController.text,
      );
      setState(() {
        _walletCreatedOrConnected = true;
        _walletAddress = wallet['address'];
        _walletBalance = wallet['balance'];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wallet created: ${wallet['address']}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create wallet: $e')),
      );
    }
  }

  Future<void> _connectWallet() async {
    try {
      final wallet = await walletService.connectWallet(
        _walletAddressController.text,
      );
      setState(() {
        _walletCreatedOrConnected = true;
        _walletAddress = wallet['address'];
        _walletBalance = wallet['balance'];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wallet connected: ${wallet['address']}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to connect wallet: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('web/icons/assets/images/dvolt_enhanced_white.png', height: 40),
            SizedBox(width: 10),
            Text('Wallet'),
          ],
        ),
        backgroundColor: Colors.green.shade900,
      ),
      body: _walletCreatedOrConnected
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Wallet Address: $_walletAddress',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Balance: $_walletBalance',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement deposit functionality
                    },
                    child: Text('Deposit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade900,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement withdraw functionality
                    },
                    child: Text('Withdraw'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade900,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                    TextField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _pinController,
                      decoration: InputDecoration(
                        labelText: 'PIN',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _confirmPinController,
                      decoration: InputDecoration(
                        labelText: 'Confirm PIN',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _createWallet,
                      child: Text('Create DVolt Wallet'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade900,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Or',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _walletAddressController,
                      decoration: InputDecoration(
                        labelText: 'Wallet Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _connectWallet,
                      child: Text('Connect Wallet'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}