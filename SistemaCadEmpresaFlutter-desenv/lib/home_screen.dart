import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
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
                          Text(
                            'Hi, ',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Jhon',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 1),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 8.0),
                      child: Text(
                        'Encontre seu curso aqui!', // Adicione seu subtítulo aqui
                        style: TextStyle(fontSize: 14),
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
                      color: Colors.white,
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
                      color: Colors.white, // Cor do texto dentro do card
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Outros widgets abaixo do card, se houver
        ],
      ),
    );
  }
}
