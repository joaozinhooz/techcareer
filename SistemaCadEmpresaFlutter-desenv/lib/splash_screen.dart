import 'dart:async';

import 'package:flutter/material.dart';

import 'arbitrary_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, arbritaryRoute);
  }

  arbritaryRoute() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const ArbitraryScreen()));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 49, 49, 49),
              ),
              child: SizedBox(
                child: Center(
                  child: SizedBox(
                    height: 170,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 100, // Altura desejada da imagem
                          width: 150, // Largura desejada da imagem
                          child: Image.asset('images/logoc.png'), // Imagem envolvida com SizedBox
                        ),
                        LinearProgressIndicator(
                          value: controller.value,
                          color: Color.fromRGBO(255, 219, 79, 1), // Definindo a cor como amarelo
                        ),
                        const Text(
                          'Carregando...',
                          style: TextStyle(color: Colors.white), // Definindo a cor do texto como branco
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20, // Ajuste a posição vertical conforme necessário
              right: 20, // Ajuste a posição horizontal conforme necessário
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(255, 219, 79, 1)), // Definindo a cor como amarelo
              ),
            ),
          ],
        ),
      ),
    );
  }
}
