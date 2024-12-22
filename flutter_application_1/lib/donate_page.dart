import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Now'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Card(
            child: ListTile(
              title: Text('Tesla EV Charger'),
              subtitle: Text('Funds Needed: \$10,000'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/track');
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('BYD EV Charger'),
              subtitle: Text('Funds Needed: \$8,000'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/track');
              },
            ),
          ),
          // Add more ListTiles for other locations
        ],
      ),
    );
  }
}
