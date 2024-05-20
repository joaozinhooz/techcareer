import 'package:flutter/material.dart';
import 'package:sistema_cadastro_empresa/notifications_screen.dart';
import 'package:sistema_cadastro_empresa/messages_screen.dart';
import 'package:sistema_cadastro_empresa/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<CourseWidget> courses = [
  CourseWidget(name: "Course 1 (Engenharia)", identifier: "engenharia", image: AssetImage('images/curso1.png')),
  CourseWidget(name: "Course 2 (Automação)", identifier: "automação", image: AssetImage('images/curso2.png')),
  CourseWidget(name: "Course 3 (Engenharia)", identifier: "engenharia", image: AssetImage('images/curso3.png')),
  CourseWidget(name: "Course 4 (Redes)", identifier: "redes", image: AssetImage('images/curso4.png')),
  CourseWidget(name: "Course 5", identifier: "course5", image: AssetImage('images/course5.png')),
  CourseWidget(name: "Course 6", identifier: "course6", image: AssetImage('images/course6.png')),
  CourseWidget(name: "Course 7", identifier: "course7", image: AssetImage('images/course7.png')),
  CourseWidget(name: "Course 8", identifier: "course8", image: AssetImage('images/course8.png')),
];


  List<CourseWidget> filteredCourses = [];

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
        children: filteredCourses,
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

class CourseWidget extends StatelessWidget {
  final String name;
  final String identifier; // Adicionando um identificador para cada curso
  final ImageProvider image;

  const CourseWidget({Key? key, required this.name, required this.identifier, required this.image}) : super(key: key);

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
          image: image,
          fit: BoxFit.cover, // Ajusta a imagem para preencher todo o espaço disponível
        ),
      ),
    );
  }
}


