import 'package:flutter/material.dart';

import 'pokebal_icon.dart';

class PokemonCard extends StatelessWidget {
  final List list;
  final int index;

  const PokemonCard({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        color: Theme.of(context).colorScheme.primary,
        child: ListTile(
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
