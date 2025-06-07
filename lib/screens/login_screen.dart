import 'package:flutter/material.dart';
import 'package:pokegalo/screens/create_acount.dart'; // Asegúrate de que este import sea correcto
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final campoEmail = TextEditingController();
  final campoPassword = TextEditingController();
  final textoInvitado = TextEditingController();

  // Método para iniciar sesión (con validación)
  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  // Método para crear cuenta (sin validación)
  void _createAcount() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const CreateAcountScreen()),
    );
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001F54), // Sin AppBar para eliminar barra blanca
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF001F54), Color(0xFF87CEEB)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 🟨 PokeGalo con fuente de Pokémon
                    Text(
                      'PokeGalo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Pokemon', // Asegúrate de que coincida con pubspec.yaml
                        fontSize: 48,
                        color: Colors.yellow,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 🟦 Subtítulo "Iniciar sesión"
                    const Text(
                      'Iniciar Sesión',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // 📨 Campo Email
                    TextFormField(
                      controller: campoEmail,
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return 'Introduce un correo válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // 🔒 Campo Contraseña
                    TextFormField(
                      controller: campoPassword,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: const TextStyle(color: Colors.grey),
                        floatingLabelStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.length < 12) {
                          return 'Mínimo 12 caracteres';
                        }
                        if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).+$')
                            .hasMatch(value)) {
                          return 'Debe contener mayúscula, número y carácter especial';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),

                    // 🔵 Botón Iniciar sesión
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 🟠 Botón Crear cuenta
                    ElevatedButton(
                      onPressed: _createAcount,  // Redirige sin validación
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Crear cuenta',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    // Separar más el texto "Entrar como invitado"
                    const SizedBox(height: 32),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      },
                      child: Text(
                        'Entrar como invitado',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.underline, // Subraya el texto
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
