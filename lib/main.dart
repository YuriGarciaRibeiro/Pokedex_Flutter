// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/pokemon_screen.dart';
import 'utils/routes/routes.dart';
import 'screens/pokedex_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  changeStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: "RobotoCondensed",
        )),
        primarySwatch: Colors.red,
        fontFamily: "Rale-way",
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
              ),
              titleMedium: const TextStyle(
                fontSize: 18,
                fontFamily: "RobotoCondensed",
              ),
              titleSmall: const TextStyle(
                fontSize: 16,
                fontFamily: "RobotoCondensed",
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        ROUTES.HOME: (ctx) => const PokedexScreen(),
        ROUTES.POKEMON_SCREEN: (ctx) => const PokemonScreen(),
      },
    );
  }
}
