import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_list.dart';

import '../components/PersonDrawer.dart';
import '../components/filter_button.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PersonDrawer(),
      appBar: AppBar(
        title: const Text(
          'Pokedex',
        ),
        centerTitle: true,
      ),
      body: const PokemonList(),
      floatingActionButton: const FilterButtom(),
    );
  }
}
