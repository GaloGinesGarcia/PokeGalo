import 'package:flutter/material.dart';
import 'package:pokegalo/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LoginScreen(), // Pantalla de inicio
    );
  }
}
