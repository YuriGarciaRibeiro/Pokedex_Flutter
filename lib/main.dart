// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'screens/pokemon_screen.dart';
import 'utils/routes/routes.dart';
import 'screens/pokedex_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Colors.white),
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
