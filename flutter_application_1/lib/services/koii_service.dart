import 'dart:convert';
import 'package:http/http.dart' as http;

class KoiiService {
  final String baseUrl = 'https://api.koii.network'; // Replace with actual Koii API base URL

  Future<List<dynamic>> fetchTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/tasks'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  Future<void> createTask(String title, String description) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'description': description,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create task');
    }
  }
}