import 'package:flutter/material.dart';
import 'pokedex_screen.dart';

class CreateAcountScreen extends StatefulWidget {
  const CreateAcountScreen({super.key});

  @override
  State<CreateAcountScreen> createState() => CreateAcountScreenState();
}

class CreateAcountScreenState extends State<CreateAcountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio de sesión"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PokedexScreen()),
                );
              },
              child: const Text('Ir a la Pokedex'),
            ),
          ],
        ),
      ),
    );
  }
}
