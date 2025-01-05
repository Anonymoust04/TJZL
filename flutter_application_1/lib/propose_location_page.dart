import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ProposeLocationPage extends StatefulWidget {
  @override
  _ProposeLocationPageState createState() => _ProposeLocationPageState();
}

class _ProposeLocationPageState extends State<ProposeLocationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _otherInfoController = TextEditingController();
  String? _selectedCountry;
  String? _selectedPostalCode;

  final List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France',
    'India',
    'China',
    'Japan',
    'Brazil',
    'Malaysia', // Added Malaysia
    // Add more countries as needed
  ];

  final Map<String, List<String>> _postalCodes = {
    'United States': ['10001', '90001', '60601', '94101', '33101'],
    'Canada': ['M5A', 'V5K', 'H1A', 'T2A', 'R2C'],
    'United Kingdom': ['EC1A', 'W1A', 'M1', 'B1', 'G1'],
    'Australia': ['2000', '3000', '4000', '5000', '6000'],
    'Germany': ['10115', '20095', '70173', '80331', '50667'],
    'France': ['75001', '13001', '69001', '06000', '33000'],
    'India': ['110001', '400001', '600001', '700001', '500001'],
    'China': ['100000', '200000', '300000', '400000', '500000'],
    'Japan': ['100-0001', '150-0001', '160-0001', '530-0001', '600-0001'],
    'Brazil': ['01000-000', '20000-000', '30000-000', '40000-000', '50000-000'],
    'Malaysia': ['50000', '50450', '50480', '50490', '50500'], // Added postal codes for Malaysia
    // Add more postal codes for each country as needed
  };

  Future<void> _saveProposedLocation() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/proposed_locations.txt';
    final file = File(filePath);
    final locationData = '${_addressController.text},${_selectedCountry},${_selectedPostalCode},${_otherInfoController.text}\n';
    await file.writeAsString(locationData, mode: FileMode.append);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Propose a Location'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCountry,
                decoration: InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
                items: _countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCountry = newValue;
                    _selectedPostalCode = null; // Reset postal code when country changes
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a country';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              if (_selectedCountry != null)
                DropdownButtonFormField<String>(
                  value: _selectedPostalCode,
                  decoration: InputDecoration(
                    labelText: 'Postal Code',
                    border: OutlineInputBorder(),
                  ),
                  items: _postalCodes[_selectedCountry]!.map((String postalCode) {
                    return DropdownMenuItem<String>(
                      value: postalCode,
                      child: Text(postalCode),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedPostalCode = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a postal code';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 20),
              TextFormField(
                controller: _otherInfoController,
                decoration: InputDecoration(
                  labelText: 'Other Information',
                  border: OutlineInputBorder(),
                ),
                // Removed the validator to make it optional
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _saveProposedLocation();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Location proposed successfully')),
                    );
                    Navigator.pop(context, true); // Pass true to indicate a new location was added
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}