import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:sistema_cadastro_empresa/detailspage.dart';
import 'package:sistema_cadastro_empresa/detailsvideo.dart';
import 'package:sistema_cadastro_empresa/search_screen.dart';
import 'package:sistema_cadastro_empresa/notifications_screen.dart'; // Importe a tela de notificações
import 'package:sistema_cadastro_empresa/messages_screen.dart';
import 'package:sistema_cadastro_empresa/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Tema claro padrão
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
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('images/videocc.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true); // Repetir o vídeo em loop
        _controller.play(); // Iniciar a reprodução do vídeo
        setState(() {}); // Atualizar a interface após a inicialização do vídeo
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Liberar recursos do controlador de vídeo
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      // Navegar para a tela de pesquisa
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchScreen(),
        ),
      );
    } else if (index == 2) {
      // Navegar para a tela de notificações
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotificationsScreen(),
        ),
      );
      } else if (index == 3) {
    // Navegar para a tela de mensagens
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessagesScreen(),
      ),
    );
    } else if (index == 4) {
  // Navegar para a tela de perfil
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProfileScreen(),
    ),
  );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo do Scaffold
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          backgroundColor: Colors.white, // Cor de fundo da barra de navegação
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alinhar itens à direita
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 8.0, top: 18.0),
                      child: Row(
                        children: [
                          Text(
                            'Hi, ',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Cor do texto
                            ),
                          ),
                          Text(
                            'Jhon',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Cor do texto
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
                        style: TextStyle(fontSize: 14, color: Colors.black), // Cor do texto
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
  padding: const EdgeInsets.only(left: 8.0, right: 5.0, top: 6.0),
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ),
      );
    },
    child: Container(
      width: 60, // Ajuste a largura do contêiner conforme necessário
      height: 50, // Ajuste a altura do contêiner conforme necessário
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Metade da largura do contêiner
        child: Image.asset('images/empresario.png'), // Exibe a imagem
      ),
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
          // Título "Continue Assistindo"
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Continue Assistindo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Stack(
            children: [
              // Vídeo
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Define as bordas arredondadas
                ),
                margin: EdgeInsets.all(10.0), // Margem ao redor do card
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller), // Reprodutor de vídeo
                ),
              ),
              // GestureDetector cobrindo o vídeo
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsVideoScreen(),
                      ),
                    );
                  },
                  behavior: HitTestBehavior.translucent, // Permite que o GestureDetector intercepte toques mesmo em áreas transparentes
                ),
              ),
            ],
          ),
          // Título "Cursos em Destaque"
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Cursos em Destaque',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Galeria de widgets com fotos
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Número de colunas na grade
              crossAxisSpacing: 10.0, // Espaçamento entre as colunas
              mainAxisSpacing: 10.0, // Espaçamento entre as linhas
              padding: EdgeInsets.all(6.0),
              children: List.generate(4, (index) {
                return GestureDetector(
                  onTap: () {
                    // Navegar para a tela de detalhes do curso com base no índice
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetailsPage(courseIndex: index),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Define as bordas arredondadas
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0), // Arredondamento das bordas
                      child: Image.asset(
                        'images/curso${index + 1}.png', // Caminho para a imagem do curso
                        fit: BoxFit.cover, // Preencher a caixa inteira
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Cor de fundo da barra de navegação
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
            label:'Notifications',
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
        unselectedItemColor: Colors.black, // Cor do texto dos ícones não selecionados
        selectedItemColor: Colors.amber,
        selectedLabelStyle: TextStyle(color: Colors.amber), // Cor do texto do ícone selecionado
        unselectedLabelStyle: TextStyle(color: Colors.white), // Cor do texto dos ícones não selecionados
        onTap: _onItemTapped,
      ),
    );
  }
}
