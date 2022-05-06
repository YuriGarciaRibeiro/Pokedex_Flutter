import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/data/Pokemons.dart';


import 'pokebal_icon.dart';

class PokemonList extends StatelessWidget {
  final pokemonsList = POKEMONS_DATA;
  final int indx = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemonsList.length,
      itemBuilder: (ctx, index) {
        return PokemonCard(
          list: pokemonsList,
          index: index,
        );
      },
    );
  }
}
