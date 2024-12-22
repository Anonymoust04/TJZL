import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Now'),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a Project to Support",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ProjectCard(
                    title: 'Tesla EV Charger',
                    subtitle: 'Funds Needed: \$70,000',
                    icon: Icons.electric_car,
                    onTap: () {
                      Navigator.pushNamed(context, '/track');
                    },
                    targetAmount: 70000.0,
                    currentAmount: 0.0,
                    percentageComplete: 0.0,
                  ),
                  ProjectCard(
                    title: 'BYD EV Charger',
                    subtitle: 'Funds Needed: \$8,000',
                    icon: Icons.bolt,
                    onTap: () {
                      Navigator.pushNamed(context, '/track');
                    },
                    targetAmount: 8000.0,
                    currentAmount: 0.0,
                    percentageComplete: 0.0,
                  ),
                  // Add more ProjectCards for other projects
                ],
              ),
            ),
          ],
        ),
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
