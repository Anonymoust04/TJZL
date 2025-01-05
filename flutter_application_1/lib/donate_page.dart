import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'enter_donation_page.dart';
import 'propose_location_page.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  Map<String, int> donations = {
    'Tesla EV Charger Chicago at (740) 686-2688 62847 Glencoe Rd Belmont, Ohio(OH), 43718': 0,
    'BYD EV Charger at 158, A4 Marsabit County, North Horr Kenya, KE (KEN)': 0,
  };

  @override
  void initState() {
    super.initState();
    _loadDonations();
    _loadProposedLocations();
  }

  Future<void> _loadDonations() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/donations.txt';
    final file = File(filePath);
    if (await file.exists()) {
      final lines = await file.readAsLines();
      for (var line in lines) {
        final parts = line.split(',');
        if (parts.length == 2) {
          setState(() {
            donations[parts[0]] = int.parse(parts[1]);
          });
        }
      }
    }
  }

  Future<void> _saveDonations() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/donations.txt';
    final file = File(filePath);
    final donationData = donations.entries.map((e) => '${e.key},${e.value}').join('\n');
    await file.writeAsString(donationData);
  }

  Future<void> _loadProposedLocations() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/proposed_locations.txt';
    final file = File(filePath);
    if (await file.exists()) {
      final lines = await file.readAsLines();
      for (var line in lines) {
        final parts = line.split(',');
        if (parts.length >= 3) {
          final location = '${parts[0]}, ${parts[1]}, ${parts[2]}';
          setState(() {
            donations.putIfAbsent(location, () => 0);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: donations.keys.map((projectName) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.green.shade700, width: 2),
                    ),
                    child: ListTile(
                      title: Text(projectName, style: TextStyle(color: Colors.white)),
                      subtitle: Text('Donated: \$${donations[projectName]}', style: TextStyle(color: Colors.white)),
                      trailing: ElevatedButton(
                        onPressed: () async {
                          final donatedAmount = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EnterDonationsPage(projectName: projectName),
                            ),
                          );
                          if (donatedAmount != null) {
                            setState(() {
                              donations[projectName] = donations[projectName]! + (donatedAmount as int);
                            });
                            await _saveDonations(); // Save donations after updating
                          }
                        },
                        child: Text('Donate'),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProposeLocationPage()),
                );
                if (result == true) {
                  _loadProposedLocations(); // Reload locations if a new one was added
                }
              },
              child: Text('Propose a Location'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}