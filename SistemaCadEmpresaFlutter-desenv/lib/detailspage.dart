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
      'imageUrl': 'images/curso1.png', // Caminho para a imagem do curso 1
    },
    {
      'title': 'Curso 2',
      'description': 'Descrição do Curso 2',
      'instructor': 'Instrutor do Curso 2',
      'imageUrl': 'images/curso2.png', // Caminho para a imagem do curso 2
    },
    {
      'title': 'Curso 3',
      'description': 'Descrição do Curso 3',
      'instructor': 'Instrutor do Curso 3',
      'imageUrl': 'images/curso3.png', // Caminho para a imagem do curso 3
    },
    {
      'title': 'Curso 4',
      'description': 'Descrição do Curso 4',
      'instructor': 'Instrutor do Curso 4',
      'imageUrl': 'images/curso4.png', // Caminho para a imagem do curso 4
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Obter os detalhes do curso com base no índice
    String courseTitle = coursesData[courseIndex]['title']!;
    String courseDescription = coursesData[courseIndex]['description']!;
    String courseInstructor = coursesData[courseIndex]['instructor']!;
    String imageUrl = coursesData[courseIndex]['imageUrl']!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Curso'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              courseTitle,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.0),
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
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
