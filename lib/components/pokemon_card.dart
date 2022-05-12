import 'package:flutter/material.dart';
import 'package:pokedex/components/type_icon.dart';
import 'package:pokedex/utils/routes/routes.dart';
import 'pokebal_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'type_icon.dart';

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
    return InkWell(
      onTap: () => _selectPokemon(context),
      borderRadius: BorderRadius.circular(10),
      splashColor: list[index].color,
      hoverColor: Colors.transparent,
    
      child: Card(
        elevation: 5,
        color: list[index].color ?? Theme.of(context).colorScheme.primary,
        child: GridTile(
          child: Image.network(
            list[index].image,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: AutoSizeText(
              list[index].name,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 1,
                fontFamily: "RobotoCondensed",
              ),
            ),
            subtitle: AutoSizeText(
              list[index].type2 != ''
                  ? list[index].type + '|' + list[index].type2
                  : list[index].type.toString(),
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "RobotoCondensed",
              ),
            ),
            trailing: IconButton(
              icon: TypeIcon(pokemon: list[index],),
              
              onPressed: () => _selectPokemon(context),
              )
            ),
          ),
        ),
      );
  }
}
