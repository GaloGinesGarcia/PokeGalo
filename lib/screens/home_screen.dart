import 'package:flutter/material.dart';
import 'pokedex_screen.dart'; // Asegúrate de que esta importación esté correcta

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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
