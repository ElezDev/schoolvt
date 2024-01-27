import 'package:flutter/material.dart';
import 'package:vtschool/models/student.dart';

class TaskScreen extends StatelessWidget {
  final List<Task> tasks;

  TaskScreen(this.tasks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas Pendientes'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          Task task = tasks[index];
          return Card(
            child: ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
            ),
          );
        },
      ),
    );
  }
}
