import 'package:flutter/material.dart';
import 'package:sistema_cadastro_empresa/notifications_screen.dart';
import 'package:sistema_cadastro_empresa/messages_screen.dart';
import 'package:sistema_cadastro_empresa/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Course> courses = [
    Course(
      name: "Course 1 (Técnico em Administração) (Tecnico em Administração)",
      identifier: "Administração",
      image: AssetImage('images/curso1.png'),
      description: "gool",
    ),
    Course(
      name: "Course 2 (Técnico em Informática) (Tecnico em Informática)",
      identifier: "Informática",
      image: AssetImage('images/curso2.png'),
    ),
    Course(
      name: "Course 3 (Técnico em Logística) (Tecnico em Logística)",
      identifier: "Logística",
      image: AssetImage('images/curso3.png'),
    ),
    Course(
      name: "Course 4 (Técnico em Eletrônica) (Tecnico em Eletrônica)",
      identifier: "Eletrônica",
      image: AssetImage('images/curso4.png'),
    ),
    Course(
      name: "Course 5 (Técnico em Mecânica) (Tecnico em Mecânica)",
      identifier: "Mecânica",
      image: AssetImage('images/curso5.png'),
    ),
    Course(
      name: "Course 6 (Técnico em Segurança do Trabalho) (Tecnico em Segurança do Trabalho)",
      identifier: "SegurançadoTrabalho",
      image: AssetImage('images/curso6.png'),
    ),
    Course(
      name: "Course 7 (Técnico em Marketing) (Tecnico em Marketing)",
      identifier: "Marketing",
      image: AssetImage('images/curso7.png'),
    ),
    Course(
      name: "Course 8 (Técnico em Recursos Humanos) (Tecnico em Recursos Humanos)",
      identifier: "TécnicoemRecursosHumanos",
      image: AssetImage('images/curso8.png'),
    ),
  ];

  List<Course> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    filteredCourses = List.from(courses);
  }

  void filterCourses(String query) {
    setState(() {
      filteredCourses = courses
          .where((course) => course.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _navigateToCourseDetails(Course course) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailsScreen(course: course),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.search, color: Colors.black),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 8.0),
                  child: TextField(
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    onChanged: (value) {
                      filterCourses(value);
                    },
                    decoration: InputDecoration(
                      hintText: '   Search',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        padding: EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: filteredCourses.map((course) {
          return GestureDetector(
            onTap: () => _navigateToCourseDetails(course),
            child: CourseItem(course: course),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber,
        selectedLabelStyle: TextStyle(color: Colors.amber),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        onTap: (int index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationsScreen(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MessagesScreen(),
              ),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final Course course;

  const CourseItem({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.amber, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: course.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class Course {
  final String name;
  final String identifier;
  final ImageProvider image;
  final String description;

  Course({required this.name, required this.identifier, required this.image, this.description = ""});
}

class CourseDetailsScreen extends StatelessWidget {
  final Course course;

  const CourseDetailsScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Course Details',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Name: ${course.name}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Identifier: ${course.identifier}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${course.description}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Adicione mais informações conforme necessário
          ],
        ),
      ),
    );
  }
}

