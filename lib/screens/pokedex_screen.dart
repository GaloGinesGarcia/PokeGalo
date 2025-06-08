import 'package:flutter/material.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF001F54),
            Color(0xFF87CEEB),
          ],
        ),
      ),
      child: const Center(
        child: Text(
          'Contenido de la Pokédex',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
