import 'package:flutter/material.dart';
import 'package:pokedex/components/pokebal_icon.dart';
import 'package:pokedex/components/pokemon_list.dart';

class PokedexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokedex',
        ),
      ),
      body: PokemonList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: PokeballIcon(),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
