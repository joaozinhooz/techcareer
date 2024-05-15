import 'package:flutter/material.dart';
import 'package:sistema_cadastro_empresa/login_screen.dart';
import 'package:sistema_cadastro_empresa/register_screen.dart';

class ArbitraryScreen extends StatefulWidget {
  const ArbitraryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ArbitraryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Container com a imagem de fundo
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/fundo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
  margin: EdgeInsets.only(top: 100), // Margem do topo
  child: SizedBox(
    height: 200,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 170,
            width: 300,
            child: Image.asset('images/logoc.png'),
          ),
        ],
      ),
    ),
  ),
),

                  SizedBox(height: 20), // Ajuste o espaçamento conforme necessário
Center(
  child: SizedBox(
    width: 200, // Defina a largura desejada para os botões
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(255,219,79,1), // Cor de fundo do botão
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Borda arredondada
        ),
        padding: EdgeInsets.symmetric(vertical: 15), // Tamanho do botão
      ),
      child: const Text(
        'Quero fazer parte!',
        style: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 0, 0, 0),
        ), // Cor do texto
      ),
    ),
  ),
),
SizedBox(height: 10),
Center(
  child: SizedBox(
    width: 200, // Defina a largura desejada para os botões
    child: OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Color.fromRGBO(255,219,79,1),
        ), // Cor da borda do botão
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Borda arredondada
        ),
        padding: EdgeInsets.symmetric(vertical: 15), // Tamanho do botão
      ),
      child: Text(
        "Já possuo conta",
        style: TextStyle(
          fontSize: 21,
          color: Color.fromRGBO(255,219,79,1),
        ), // Cor do texto
      ),
    ),
  ),
),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
