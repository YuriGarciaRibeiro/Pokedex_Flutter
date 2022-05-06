import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class PokemonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pokemon selectPokemon =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectPokemon.name),
      ),
    );
  }
}
