import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'), // Título da barra de navegação
      ),
      body: Center(
        child: Text(
          'Tela de Perfil', // Conteúdo da tela de perfil
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
