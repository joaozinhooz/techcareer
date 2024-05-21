import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.amber, // Cor amarela para a barra de navegação
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/empresario.png'), // URL da imagem do perfil
              ),
              SizedBox(height: 16.0),
              Text(
                'Jhon Doe', // Nome do usuário
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'johndoe@example.com', // Email do usuário
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                color: Colors.teal.shade800, // Cor de fundo do card
                child: ListTile(
                  leading: Icon(Icons.verified_user, color: Colors.black), // Ícone preto
                  title: Text('Certification', style: TextStyle(color: Colors.black)), // Texto preto
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flutter Developer Certification', // Nome do certificado
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Texto preto
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Issued by: Flutter Institute', // Emissor do certificado
                        style: TextStyle(color: Colors.black), // Texto preto
                      ),
                      Text(
                        'Issued on: January 1, 2024', // Data de emissão do certificado
                        style: TextStyle(color: Colors.black), // Texto preto
                      ),
                      Text(
                        'Expiration: None', // Data de expiração do certificado
                        style: TextStyle(color: Colors.black), // Texto preto
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Divider(),
              SizedBox(height: 16.0),
              Card(
                color: Colors.amber, // Cor de fundo do card
                child: ListTile(
                  leading: Icon(Icons.location_on, color: Colors.black), // Ícone preto
                  title: Text('Location', style: TextStyle(color: Colors.black)), // Texto preto
                  subtitle: Text('New York, USA', style: TextStyle(color: Colors.black)), // Localização do usuário
                ),
              ),
              Card(
                color: Colors.amber, // Cor de fundo do card
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.black), // Ícone preto
                  title: Text('About', style: TextStyle(color: Colors.black)), // Texto preto
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum.', // Descrição sobre o usuário
                    style: TextStyle(color: Colors.black), // Texto preto
                  ),
                ),
              ),
              Card(
                color: Colors.amber, // Cor de fundo do card
                child: ListTile(
                  leading: Icon(Icons.link, color: Colors.black), // Ícone preto
                  title: Text('Website', style: TextStyle(color: Colors.black)), // Texto preto
                  subtitle: Text('https://johndoe.com', style: TextStyle(color: Colors.black)), // Website do usuário
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
