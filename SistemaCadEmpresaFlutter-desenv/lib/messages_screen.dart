import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'), // Título da barra de navegação
      ),
      body: Center(
        child: Text(
          'Tela de Mensagens', // Conteúdo da tela de mensagens
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
