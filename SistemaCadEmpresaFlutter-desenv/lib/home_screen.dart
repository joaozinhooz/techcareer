import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Tema claro padrão
      darkTheme: ThemeData.dark(), // Tema escuro padrão
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;
  bool _isDarkMode = false; // Variável para controlar o modo claro/escuro
  Color _iconColor = Colors.grey; // Cor do ícone do modo escuro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white, // Cor de fundo do Scaffold
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white, // Cor de fundo da barra de navegação
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinhar itens à direita
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 8.0, top: 8.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: _isDarkMode
                                ? Icon(Icons.wb_sunny, color: _iconColor)
                                : Icon(Icons.nightlight_round, color: _iconColor),
                            onPressed: () {
                              setState(() {
                                _isDarkMode = !_isDarkMode; // Alternar entre claro e escuro
                                _iconColor = _isDarkMode ? Colors.amber : Colors.black; // Altera a cor do ícone
                              });
                            },
                          ),
                          Text(
                            'Hi, ',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: _isDarkMode ? Colors.white : Colors.black, // Cor do texto
                            ),
                          ),
                          Text(
                            'Jhon',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: _isDarkMode ? Colors.white : Colors.black, // Cor do texto
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 1),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 8.0, bottom: 10.0),
                      child: Text(
                        'Encontre seu curso aqui!', // Adicione seu subtítulo aqui
                        style: TextStyle(fontSize: 14, color: _isDarkMode ? Colors.white : Colors.black), // Cor do texto
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 5.0, top: 6.0),
                child: Container(
                  width: 60, // Ajuste a largura do contêiner conforme necessário
                  height: 50, // Ajuste a altura do contêiner conforme necessário
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _isDarkMode ? Color.fromARGB(255, 33, 33, 33) : Colors.white,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11), // Metade da largura do contêiner
                    child: Image.asset('images/empresario.png'), // Exibe a imagem
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              // Navegação para outra tela aqui
            },
            child: Card(
              color: Colors.blue, // Cor do card
              margin: EdgeInsets.all(10.0), // Margem ao redor do card
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: Text(
                    'Clique aqui para ir a outra tela',
                    style: TextStyle(
                      fontSize: 18,
                      color: _isDarkMode ? const Color(0xFFFFFFFF) : Colors.white, // Cor do texto dentro do card
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Outros widgets abaixo do card, se houver
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        unselectedItemColor: _isDarkMode ? const Color(0xFFFFFFFF) : Colors.black, // Cor do texto dos ícones não selecionados
        selectedItemColor: Colors.amber,
        selectedLabelStyle: TextStyle(color: Colors.amber), // Cor do texto do ícone selecionado
        unselectedLabelStyle: TextStyle(color: _isDarkMode ? Colors.white : Colors.black), // Cor do texto dos ícones não selecionados
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white, // Cor de fundo da barra de navegação
      ),
    );
  }
}
