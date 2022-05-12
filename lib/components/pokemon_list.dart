import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/data/Pokemons.dart';

class PokemonList extends StatelessWidget {
  final pokemonsList = POKEMONS_DATA;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pokemonsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) {
        return PokemonCard(
          list: pokemonsList,
          index: index,
        );
      },
    );
  }
}
