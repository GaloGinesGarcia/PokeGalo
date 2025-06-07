import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login_screen.dart'; // Asegúrate de importar la pantalla de LoginScreen

class CreateAcountScreen extends StatefulWidget {
  const CreateAcountScreen({super.key});

  @override
  State<CreateAcountScreen> createState() => _CreateAcountScreenState();
}

class _CreateAcountScreenState extends State<CreateAcountScreen> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final apellidosController = TextEditingController();
  final paisController = TextEditingController();
  final ciudadController = TextEditingController();
  final codigoPostalController = TextEditingController();
  final edadController = TextEditingController();
  final telefonoController = TextEditingController();
  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  final confirmarContrasenaController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      edadController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  void _crearCuenta() {
    if (_formKey.currentState!.validate()) {
      // Lógica de creación de cuenta (puedes cambiar esto)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cuenta creada exitosamente')),
      );
    }
  }

  void _cancelarRegistro() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()), // Aquí se navega a LoginScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001F54),
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50), // Añadido un espacio en la parte superior

                  const Text(
                    'Registro de cuenta',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Campos con sus textos arriba
                  buildTextAboveField('Nombre'),
                  buildInput('Nombre', nombreController),

                  const SizedBox(height: 12),

                  buildTextAboveField('Apellidos'),
                  buildInput('Apellidos', apellidosController),

                  const SizedBox(height: 12),

                  buildTextAboveField('País'),
                  buildInput('País', paisController),

                  const SizedBox(height: 12),

                  buildTextAboveField('Ciudad'),
                  buildInput('Ciudad', ciudadController),

                  const SizedBox(height: 12),

                  buildTextAboveField('Código Postal'),
                  buildInput('Código Postal', codigoPostalController, keyboardType: TextInputType.number),

                  const SizedBox(height: 12),

                  buildTextAboveField('Edad'),
                  buildInput(
                    'Edad',
                    edadController,
                    readOnly: true,
                    onTap: _selectDate,
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),

                  const SizedBox(height: 12),

                  buildTextAboveField('Número de Teléfono (opcional)'),
                  buildInput(
                    'Número de Teléfono (opcional)',
                    telefonoController,
                    keyboardType: TextInputType.phone,
                    prefixText: '+34 ',
                    required: false,
                  ),

                  const SizedBox(height: 12),

                  buildTextAboveField('Correo Electrónico'),
                  buildInput(
                    'Correo Electrónico',
                    correoController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Introduce un correo válido';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  buildTextAboveField('Contraseña'),
                  buildPasswordInput(
                    'Contraseña',
                    contrasenaController,
                    _obscurePassword,
                    () => setState(() => _obscurePassword = !_obscurePassword),
                  ),

                  const SizedBox(height: 12),

                  buildTextAboveField('Confirmar Contraseña'),
                  buildPasswordInput(
                    'Confirmar Contraseña',
                    confirmarContrasenaController,
                    _obscureConfirmPassword,
                    () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                    validator: (value) {
                      if (value != contrasenaController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 32),

                  // Primer botón
                  ElevatedButton(
                    onPressed: _crearCuenta,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Registro de cuenta',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 16), // Espacio adicional entre los botones

                  // Botón de cancelar registro con rojo más intenso
                  ElevatedButton(
                    onPressed: _cancelarRegistro,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700, // Rojo más intenso
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Cancelar registro',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextAboveField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildInput(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? suffixIcon,
    String? prefixText,
    bool required = true,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          floatingLabelStyle: const TextStyle(color: Colors.black),
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: suffixIcon,
          prefixText: prefixText,
        ),
        validator: validator ??
            (value) {
              if (required && (value == null || value.isEmpty)) {
                return 'Este campo es obligatorio';
              }
              return null;
            },
      ),
    );
  }

  Widget buildPasswordInput(
    String label,
    TextEditingController controller,
    bool obscureText,
    VoidCallback toggleVisibility, {
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          floatingLabelStyle: const TextStyle(color: Colors.black),
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: toggleVisibility,
          ),
        ),
        validator: validator ??
            (value) {
              if (value == null || value.length < 12) {
                return 'Mínimo 12 caracteres';
              }
              if (!RegExp(
                r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
              ).hasMatch(value)) {
                return 'Debe contener mayúscula, número y carácter especial';
              }
              return null;
            },
      ),
    );
  }
}
