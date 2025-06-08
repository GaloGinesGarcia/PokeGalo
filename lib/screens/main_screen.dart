import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'pokedex_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;


  //* Persistencia de datos dentro de la app
  _savePreferences(String key, dynamic value) async {

    final prefs = await SharedPreferences.getInstance();
    if(value is bool){
      await prefs.setBool(key, value);
    }else if (value is String){
      await prefs.setString(key, value);
    }else if(value is double){
      await prefs.setDouble(key, value);
    }else if(value is int){
      await prefs.setInt(key, value);
    }

  }

  final List<Widget> screens = const [
    HomeScreen(),
    PokedexScreen(),
    Center(child: Text('Favoritos', style: TextStyle(fontSize: 24))),
    Center(child: Text('Ajustes', style: TextStyle(fontSize: 24))),
    Center(child: Text('Perfil', style: TextStyle(fontSize: 24))),
  ];

  final List<String> titles = [
    'Inicio',
    'Pokédex',
    'Favoritos',
    'Ajustes',
    'Perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon),
            label: 'Pokédex',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
