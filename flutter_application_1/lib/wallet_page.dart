import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  double balance = 1000.0; // Example balance
  String selectedToken = 'USDT';
  
  void _showDepositDialog() {
    // TODO: Implement deposit dialog
  }

  void _showWithdrawDialog() {
    // TODO: Implement withdraw dialog  
  }

  void _showSwapDialog() {
    // TODO: Implement swap dialog
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Balance',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '$balance $selectedToken',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(
                  icon: Icons.add,
                  label: 'Deposit',
                  onTap: () => _showDepositDialog(),
                ),
                ActionButton(
                  icon: Icons.remove,
                  label: 'Withdraw',
                  onTap: () => _showWithdrawDialog(),
                ),
                ActionButton(
                  icon: Icons.swap_horiz,
                  label: 'Swap',
                  onTap: () => _showSwapDialog(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Rewards Earned',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.stars, color: Colors.amber),
                title: Text('DVC Coins'),
                trailing: Text(
                  '150 DVC',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 32),
          SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}