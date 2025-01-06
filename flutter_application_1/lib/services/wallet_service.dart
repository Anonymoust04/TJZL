import 'dart:convert';
import 'package:http/http.dart' as http;

class WalletService {
  final String baseUrl = 'https://api.koii.network'; // Replace with actual Koii API base URL

  Future<Map<String, dynamic>> createWallet(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create_wallet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create wallet');
    }
  }

  Future<Map<String, dynamic>> connectWallet(String walletAddress) async {
    final response = await http.post(
      Uri.parse('$baseUrl/connect_wallet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'walletAddress': walletAddress,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to connect wallet');
    }
  }
}