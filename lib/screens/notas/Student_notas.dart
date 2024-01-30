import 'package:flutter/material.dart';
import 'package:vtschool/models/student.dart';

class GradeSimulationScreen extends StatelessWidget {
  final Student student;

  const GradeSimulationScreen(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calificaciones de ${student.name}'),
      ),
      body: ListView.builder(
        itemCount: student.grades.length,
        itemBuilder: (context, index) {
          Grade grade = student.grades[index];
          return ListTile(
            title: Text(grade.subject),
            subtitle: Text('Calificación: ${grade.score.toString()}'),
          );
        },
      ),
    );
  }
}
