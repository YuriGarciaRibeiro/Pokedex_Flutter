import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final List list;
  final int index;

  const PokemonCard({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Text(
            list[index].name,
            style: const TextStyle(color: Colors.white),
          ),
          leading: Row(
            children: [
              Text(
                '${list[index].id}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          trailing: Text(
            list[index].type,
            style: const TextStyle(color: Colors.white),
          ),


        ),
      ),
    );
  }
}
