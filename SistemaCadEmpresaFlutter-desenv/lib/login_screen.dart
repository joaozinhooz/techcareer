import 'package:flutter/material.dart';
import 'package:sistema_cadastro_empresa/arbitrary_screen.dart';

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
                    margin: const EdgeInsets.only(top: 80),
                    height: 200,
                    child: Center(
                      child: SizedBox(
                        height: 170,
                        width: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: <Widget>[
                              Image.asset('images/aimvx_logo.png'),
                              const Text("Sistema de Cadastro de Empresa",
                                  style: TextStyle(fontSize: 16))
                            ])
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 280,
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Usuário ou e-mail',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 51),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        const Text("Lembrar-me", style: TextStyle(fontSize: 14))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 280,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Chama o método de login
                      _login();

                      // Verifica se o login foi bem-sucedido
                      if (_usernameController.text == 'joao' &&
                          _passwordController.text == '123') {
                        // Se o login for bem-sucedido, navega para a próxima página
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArbitraryScreen()));
                      }
                    },
                    child: const Text('Entrar'),
                  ),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ArbitraryScreen()));
                      },
                      child: const Text('Voltar'),
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
