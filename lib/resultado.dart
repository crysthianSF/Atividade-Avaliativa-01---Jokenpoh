import 'package:flutter/material.dart';
import 'jogo.dart';

class ResultadoPagina extends StatelessWidget {
  final String escolhaUsuario;
  final String escolhaApp;
  final String resultado;

  const ResultadoPagina({
    super.key,
    required this.escolhaUsuario,
    required this.escolhaApp,
    required this.resultado,
});
  @override
  Widget build(BuildContext context) {
   String imagemResultado = resultado == "Você venceu"
       ?"assets/images/vitoria.png" : "assets/images/perder.png";

   return Scaffold(
     appBar: AppBar(
       title: const Text('resultado', style: TextStyle(color: Colors.white),
       ),
       backgroundColor: Colors.red,
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           const Text("Escolha do APP", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
           Image.asset("assets/images/$escolhaApp.png", height: 100),

           const SizedBox(height: 20),

           const Text("Sua escolha", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
           Image.asset("assets/images/$escolhaUsuario.png", height: 100),

           const SizedBox(height: 20),

           Image.asset(imagemResultado, height: 100),
           Text(
             resultado,
             style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
           ),

           const SizedBox(height: 20),

           ElevatedButton(
             onPressed: () {
               Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (context) => const Jogo()),
               );
             },
             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
             child: const Text("Jogar novamente", style: TextStyle(color: Colors.white),),
           ),
         ],
       ),
     )
   );
  }


}