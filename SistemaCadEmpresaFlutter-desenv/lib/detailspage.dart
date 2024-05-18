import 'package:flutter/material.dart';

class CourseDetailsPage extends StatelessWidget {
  final int courseIndex;

  CourseDetailsPage({required this.courseIndex});

  // Lista de dados com informações de cada curso
  final List<Map<String, String>> coursesData = [
    {
      'title': 'Curso 1',
      'description': 'Descrição do Curso 1',
      'instructor': 'Instrutor do Curso 1',
    },
    {
      'title': 'Curso 2',
      'description': 'Descrição do Curso 2',
      'instructor': 'Instrutor do Curso 2',
    },
    {
      'title': 'Curso 3',
      'description': 'Descrição do Curso 3',
      'instructor': 'Instrutor do Curso 3',
    },
    {
      'title': 'Curso 4',
      'description': 'Descrição do Curso 4',
      'instructor': 'Instrutor do Curso 4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Obter os detalhes do curso com base no índice
    String courseTitle = coursesData[courseIndex]['title']!;
    String courseDescription = coursesData[courseIndex]['description']!;
    String courseInstructor = coursesData[courseIndex]['instructor']!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Curso'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              courseTitle,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    'Descrição:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    courseDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Instrutor:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    courseInstructor,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
