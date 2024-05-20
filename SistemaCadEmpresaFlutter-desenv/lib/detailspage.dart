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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      courseTitle,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0), // Reduzido de 20.0 para 10.0
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Descrição:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          courseDescription,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Instrutor:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          courseInstructor,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          AnimatedButton(),
        ],
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  void _togglePress() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePress,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.blueAccent : Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            'Começar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
