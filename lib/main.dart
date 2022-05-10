// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/pokemon_screen.dart';
import 'utils/routes/routes.dart';
import 'screens/pokedex_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    changeStatusBarColor(Colors.white);
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
            color: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "RobotoCondensed",
            )),
        fontFamily: "Raleway",
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
        ROUTES.HOME: (ctx) => PokedexScreen(),
        ROUTES.POKEMON_SCREEN: (ctx) => PokemonScreen(),
      },
    );
  }
}
