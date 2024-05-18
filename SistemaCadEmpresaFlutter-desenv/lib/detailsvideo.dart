import 'package:flutter/material.dart';

class DetailsVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Engenharia de Software',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Lista de Vídeos',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Barra de Progresso
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0), // Margem lateral
            child: Stack(
              children: [
                LinearProgressIndicator(
                  value: 0.6, // Valor da barra de progresso (0.6 = 60%)
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                  minHeight: 20, // Altura da barra de progresso
                  borderRadius: BorderRadius.circular(20),
                ),
                Center(
                  child: Text(
                    '60%',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Lista de Vídeos
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                // Define a cor do ícone com base no índice
                Color iconColor = index <= 2 ? Colors.green : Colors.black;
                String videoDescription = '';
                // Define a descrição com base no índice
                switch (index) {
                  case 0:
                    videoDescription = 'Introdução à Engenharia de Software';
                    break;
                  case 1:
                    videoDescription = 'Desenvolvimento Ágil de Software';
                    break;
                  case 2:
                    videoDescription = 'Testes de Software: Conceitos Básicos';
                    break;
                  case 3:
                    videoDescription = 'Arquitetura de Software Moderna';
                    break;
                  case 4:
                    videoDescription = 'Gerenciamento de Projetos de Software';
                    break;
                  default:
                    videoDescription = 'Descrição do Vídeo ${index + 1}';
                }
                return ListTile(
                  leading: Icon(
                    Icons.video_library,
                    color: iconColor,
                  ), // Ícone de vídeo à esquerda
                  title: Text('Vídeo ${index + 1}'), // Nome do vídeo
                  subtitle: Text(videoDescription), // Descrição do vídeo
                  onTap: () {
                    // Ação ao clicar no vídeo
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
