import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrackDonationsPage extends StatefulWidget {
  final String projectName;

  TrackDonationsPage({required this.projectName});

  @override
  _TrackDonationsPageState createState() => _TrackDonationsPageState();
}

class _TrackDonationsPageState extends State<TrackDonationsPage> {
  final TextEditingController _amountDonatedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Donations'),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            DonationStatusCard(
              projectName: widget.projectName,
              amountDonated: _amountDonatedController.text.isEmpty ? 0 : int.parse(_amountDonatedController.text),
              isDividendEligible: true, // Adjust based on your logic
            ),
            TextFormField(
              controller: _amountDonatedController,
              decoration: InputDecoration(labelText: 'Amount Donated'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _amountDonatedController.text.isNotEmpty && int.tryParse(_amountDonatedController.text) != null
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        // Return the donated amount as an int
                        Navigator.pop(context, int.parse(_amountDonatedController.text));
                      }
                    }
                  : null,
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class DonationStatusCard extends StatelessWidget {
  final String projectName;
  final int amountDonated;
  final bool isDividendEligible;

  DonationStatusCard({
    required this.projectName,
    required this.amountDonated,
    required this.isDividendEligible,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(projectName),
        subtitle: Text('Donated: \$${amountDonated}'),
        trailing: isDividendEligible ? Icon(Icons.check_circle, color: Colors.green) : Icon(Icons.cancel, color: Colors.red),
      ),
    );
  }
}
