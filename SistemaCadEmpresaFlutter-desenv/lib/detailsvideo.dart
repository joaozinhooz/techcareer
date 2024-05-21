import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailsVideoScreen extends StatefulWidget {
  @override
  _DetailsVideoScreenState createState() => _DetailsVideoScreenState();
}

class _DetailsVideoScreenState extends State<DetailsVideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Inicialize o controlador com o caminho do vídeo local
    _controller = VideoPlayerController.asset(
      'images/videoes.mp4', // Substitua pelo nome do seu vídeo
    )
      ..initialize().then((_) {
        setState(() {}); // Atualize o estado para reconstruir o widget e exibir o vídeo
        _controller.play(); // Reproduza o vídeo automaticamente ao inicializar
      })
      ..setLooping(true); // Define o vídeo para repetir automaticamente
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Liberte o controlador de vídeo quando não for mais necessário
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Técnico em Informática',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8), // Espaço entre o texto e o ícone
            Icon(
              Icons.verified,
              color: Colors.green,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vídeo com bordas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey, width: 2.0),
              ),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio, // Define a proporção do vídeo
                child: VideoPlayer(_controller),
              ),
            ),
          ),
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
          // Texto acima da barra de progresso
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Seu progresso no curso',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 8),
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
                    videoDescription = 'Fundamentos de Programação';
                    break;
                  case 1:
                    videoDescription = 'Redes de Computadores e Internet';
                    break;
                  case 2:
                    videoDescription = 'Desenvolvimento de Aplicações Web';
                    break;
                  case 3:
                    videoDescription = 'Banco de Dados e SQL';
                    break;
                  case 4:
                    videoDescription = 'Manutenção e Suporte de Computadores';
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
