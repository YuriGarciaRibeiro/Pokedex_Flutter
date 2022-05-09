import 'package:flutter/material.dart';
import 'package:pokedex/components/pokebal_icon.dart';
import 'package:pokedex/components/pokemon_list.dart';

import '../data/Pokemons.dart';

final pokemonsList = POKEMONS_DATA;

_openPokemonSearchModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          children: <Widget>[
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      );
    },
  );
}



class PokedexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokedex',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _openPokemonSearchModal(context),
          ),
        ],
      ),
      body: PokemonList(pokemonsList: pokemonsList),
    );
  }
}
