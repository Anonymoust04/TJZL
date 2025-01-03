import 'package:flutter/material.dart';
import 'track_donations_page.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  Map<String, int> donations = {
    'Tesla EV Charger': 0,
    'BYD EV Charger': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: donations.keys.map((projectName) {
          return ListTile(
            title: Text(projectName),
            subtitle: Text('Donated: \$${donations[projectName]}'),
            trailing: ElevatedButton(
              onPressed: () async {
                final donatedAmount = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrackDonationsPage(projectName: projectName),
                  ),
                );
                if (donatedAmount != null) {
                  setState(() {
                    donations[projectName] = donations[projectName]! + (donatedAmount as int);
                  });
                }
              },
              child: Text('Donate'),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final double targetAmount;
  final double currentAmount;
  final double percentageComplete;

  const ProjectCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    required this.targetAmount,
    required this.currentAmount,
    this.percentageComplete = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade100,
              child: Icon(icon, color: Colors.green.shade700),
            ),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subtitle),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: percentageComplete,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                Text(
                    '${(percentageComplete * 100).toStringAsFixed(1)}% funded'),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: onTap,
              child: Text('Donate'),
            ),
          ),
        ],
      ),
    );
  }
}
