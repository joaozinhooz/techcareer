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
                  SizedBox(
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
                  SizedBox(height: 200),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Cor de fundo do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Borda arredondada
                      ),
                    ),
                    child: const Text(
                      'Quero fazer parte!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ), // Cor do texto
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
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
                          color: Colors.blue,
                        ), // Cor da borda do botão
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Borda arredondada
                        ),
                      ),
                      child: Text(
                        "Já possuo conta",
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.blue,
                        ), // Cor do texto
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
