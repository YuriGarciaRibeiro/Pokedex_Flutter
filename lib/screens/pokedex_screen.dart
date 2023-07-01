import 'package:flutter/material.dart';
import 'package:pokedex/components/pokebal_icon.dart';
import 'package:pokedex/components/pokemon_list.dart';

class PokedexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Pokedex',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Items'),
              subtitle: Text('Coming soon'),

            ),
            ListTile(
              title: Text('Moves'),
              subtitle: Text('Coming soon'),
            ),
            ListTile(
              title: Text('Berries'),
              subtitle: Text('Coming soon'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Pokedex',
        ),
        centerTitle: true,

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
