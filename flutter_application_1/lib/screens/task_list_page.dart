import 'package:flutter/material.dart';
import '../services/koii_service.dart'; // Use relative path

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final KoiiService koiiService = KoiiService();
  late Future<List<dynamic>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = koiiService.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koii Tasks'),
        backgroundColor: Colors.green.shade700,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final task = snapshot.data![index];
                return ListTile(
                  title: Text(task['title']),
                  subtitle: Text(task['description']),
                );
              },
            );
          }
        },
      ),
    );
  }
}