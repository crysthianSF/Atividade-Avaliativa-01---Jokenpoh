import 'package:flutter/material.dart';
import 'dart:math';
import 'resultado.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  final List<String> opcoes = ["pedra", "papel", "tesoura"];

  void _jogar(String escolhaUsuario) {
    String escolhaApp = opcoes[Random().nextInt(3)];
    String resultado;

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      resultado = "Você venceu";
    } else if (escolhaUsuario == escolhaApp) {
      resultado = "Empate";
    } else {
      resultado = "Você perdeu";
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoPagina(
          escolhaUsuario: escolhaUsuario,
          escolhaApp: escolhaApp,
          resultado: resultado,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pedra, Papel, Tesoura',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Escolha uma opção", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _jogar("pedra"),
                child: Image.asset("assets/images/pedra.png", height: 80),
              ),
              GestureDetector(
                onTap: () => _jogar("papel"),
                child: Image.asset("assets/images/papel.png", height: 80),
              ),
              GestureDetector(
                onTap: () => _jogar("tesoura"),
                child: Image.asset("assets/images/tesoura.png", height: 80),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
