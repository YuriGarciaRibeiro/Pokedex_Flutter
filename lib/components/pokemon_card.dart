import 'package:flutter/material.dart';
import 'package:pokedex/utils/routes/routes.dart';

import 'pokebal_icon.dart';

class PokemonCard extends StatelessWidget {
  final List list;
  final int index;

  const PokemonCard({this.list, this.index});

  _selectPokemon(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ROUTES.POKEMON_SCREEN, arguments: list[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        color: list[index].color ?? Colors.red,
        child: ListTile(
          onTap: () => _selectPokemon(context),
          leading: Text(
            (list[index].id).toString(),
            style: const TextStyle(color: Colors.white),
          ),
          title: Text(
            list[index].name,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            list[index].type2 == ''
                ? list[index].type
                : list[index].type + ' | ' + list[index].type2,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: PokeballIcon(),
        ));
  }
}
