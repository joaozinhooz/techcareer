import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Container com a imagem de fundo ocupando toda a tela
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/fundo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 200,
                      child: SizedBox(
                        height: 150, // Altura do logotipo reduzida para 150
                        width: 150, // Largura do logotipo reduzida para 150
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'images/logoc.png',
                                  width: 120, // Redimensionando a largura da imagem
                                  height: 120, // Redimensionando a altura da imagem
                                ),
                                const Text(
                                  "",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: 280,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Usuário',
                            fillColor: Colors.transparent,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), // Cor da borda quando o campo não está em foco
                            borderRadius: BorderRadius.circular(10), // Borda arredondada
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: 280,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            fillColor: Colors.transparent,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), // Cor da borda quando o campo não está em foco
                            borderRadius: BorderRadius.circular(10), // Borda arredondada
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: 280,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Senha',
                            fillColor: Colors.transparent,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                           enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), // Cor da borda quando o campo não está em foco
                            borderRadius: BorderRadius.circular(10), // Borda arredondada
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: 280,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Repetir senha',
                            fillColor: Colors.transparent,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), // Cor da borda quando o campo não está em foco
                            borderRadius: BorderRadius.circular(10), // Borda arredondada
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200, // Definindo um tamanho menor para os botões
                      child: ElevatedButton(
                        onPressed: () {
                          // vai para Quero fazer parte!
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10), // tamanho do botão
                          backgroundColor: Color.fromRGBO(255,219,79,1), // cor de fundo do botão
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Adicionando um espaçamento entre os botões
                    SizedBox(
                      width: 200, // Definindo um tamanho menor para os botões
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15), // tamanho do botão
                          side: BorderSide(color: Color.fromRGBO(255,219,79,1)), // cor da borda
                        ),
                        child: const Text(
                          'Voltar',
                          style: TextStyle(fontSize: 16, color: Colors.white), // Alterando a cor do texto para branco
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
