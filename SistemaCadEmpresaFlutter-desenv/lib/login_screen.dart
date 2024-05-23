import 'package:flutter/material.dart';
import 'package:sistema_cadastro_empresa/arbitrary_screen.dart';
import 'package:sistema_cadastro_empresa/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Aqui você pode implementar a lógica de login
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Verificar se o usuário e a senha correspondem a um usuário registrado
    if (username == 'joao' && password == '123') {
      // Login bem-sucedido
      print('Login bem-sucedido para o usuário: $username');
    } else {
      // Login falhou
      print('Usuário ou senha incorretos.');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('Usuário ou senha incorretos.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Imagem de plano de fundo
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
                    margin: const EdgeInsets.only(top: 50), // Ajuste a margem superior aqui
                    height: 200, // Altura do logotipo reduzida para 150
                    child: Center(
                      child: SizedBox(
                        height: 150, // Altura do logotipo reduzida para 120
                        width: 150, // Largura do logotipo reduzida para 120
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: <Widget>[
                              Image.asset(
                                'images/logoc.png',
                                width: 120, // Redimensionando a largura da imagem
                                height: 120, // Redimensionando a altura da imagem
                              ),
                              const Text("",
                                  style: TextStyle(fontSize: 16))
                            ])
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Adicionando espaço entre a imagem e os inputs
                  Center(
                    child: SizedBox(
                      width: 280,
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), // Cor da borda
                          ),
                          labelText: 'Usuário ou e-mail',
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
                  SizedBox(height: 10), // Adicionando espaço entre os inputs
                  Container(
                    margin: const EdgeInsets.only(left: 51),
                    // child: Row(
                    //   children: [
                    //     SizedBox(
                    //       child: Checkbox(
                    //         value: isChecked,
                    //         onChanged: (bool? value) {
                    //           setState(() {
                    //             isChecked = value!;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //     const Text("Lembrar-me", style: TextStyle(fontSize: 14))
                    //   ],
                    // ),
                  ),
                  SizedBox(height: 10), // Adicionando espaço entre os inputs e a senha
                  Center(
                    child: SizedBox(
                      width: 280,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white), // Cor da borda
                          ),
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
                  SizedBox(height: 10, width: 200,), // Adicionando espaço entre os inputs e os botões
                  SizedBox(
                    width: 200, // Definindo um tamanho menor para os botões
                    child: ElevatedButton(
                      onPressed: () {
                        // Chama o método de login
                        _login();

                        // Verifica se o login foi bem-sucedido
                        if (_usernameController.text == 'adm' &&
                            _passwordController.text == '123') {
                          // Se o login for bem-sucedido, navega para a próxima página
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15), // tamanho do botão
                        backgroundColor: Color.fromRGBO(255,219,79,1), // cor de fundo do botão
                      ),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 16, color: Colors.black), // Alterando a cor do texto para branco
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Adicionando espaço entre os botões
                  SizedBox(
                    width: 200, // Definindo um tamanho menor para os botões
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArbitraryScreen(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15), // tamanho do botão
                        side: BorderSide(color: Color.fromRGBO(255,219,79,1)), // cor da borda
                      ),
                      child: const Text(
                        'Voltar',
                        style: TextStyle(fontSize: 16, color: Color.fromRGBO(255,219,79,1)), // Alterando a cor do texto para branco
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
