import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
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
                'jhondoe@gmail.com', // Email do usuário
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
                  title: Text('Certificado', style: TextStyle(color: Colors.black)), // Texto preto
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Certificação em Técnico de Informática', // Nome do certificado
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Texto preto
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Emitido por: Instituto Tech Career', // Emissor do certificado
                        style: TextStyle(color: Colors.black), // Texto preto
                      ),
                      Text(
                        'Emitido em: 1º de janeiro de 2024', // Data de emissão do certificado
                        style: TextStyle(color: Colors.black), // Texto preto
                      ),
                      Text(
                        'Expiração: Nenhuma', // Data de expiração do certificado
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
                  title: Text('Local', style: TextStyle(color: Colors.black)), // Texto preto
                  subtitle: Text('São Paulo, BR', style: TextStyle(color: Colors.black)), // Localização do usuário
                ),
              ),
              Card(
                color: Colors.amber, // Cor de fundo do card
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.black), // Ícone preto
                  title: Text('Sobre', style: TextStyle(color: Colors.black)), // Texto preto
                  subtitle: Text(
                    'A Tech Career capacita indivíduos com cursos práticos de tecnologia, promovendo inclusão e preparação para desafios da indústria. Junte-se a nós para impulsionar sua carreira na crescente indústria de tecnologia.', // Descrição sobre o usuário
                    style: TextStyle(color: Colors.black), // Texto preto
                  ),
                ),
              ),
              Card(
                color: Colors.amber, // Cor de fundo do card
                child: ListTile(
                  leading: Icon(Icons.link, color: Colors.black), // Ícone preto
                  title: Text('Website', style: TextStyle(color: Colors.black)), // Texto preto
                  subtitle: Text('https://techcareer.com', style: TextStyle(color: Colors.black)), // Website do usuário
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
