import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/data/Pokemons.dart';




class PokemonList extends StatelessWidget {
  List pokemonsList;


  PokemonList({this.pokemonsList});

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
