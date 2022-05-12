import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class TypeIcon extends StatelessWidget {
  Pokemon pokemon;

  TypeIcon({this.pokemon});

  @override
  Widget build(BuildContext context) {
    IconData icone;

    if (pokemon.type == 'Grass') {
      icone = Icons.grass_sharp;
    }
    if (pokemon.type == 'Fire') {
      icone = Icons.whatshot_sharp;
    }
    if (pokemon.type == 'Water') {
      icone = Icons.water_drop_sharp;
    }
    if (pokemon.type == 'Bug') {
      icone = Icons.bug_report_sharp;
    }
    if (pokemon.type == 'Normal') {
      icone = Icons.person_outline;
    }
    if (pokemon.type == 'Electric') {
      icone = Icons.flash_on_sharp;
    }
    if (pokemon.type == 'Ground') {
      icone = Icons.terrain_sharp;
    }
    if (pokemon.type == 'Fighting') {
      icone = Icons.fitness_center_sharp;
    }
    if (pokemon.type == 'Psychic') {
      icone = Icons.catching_pokemon_sharp;
    }
    if (pokemon.type == 'Rock') {
      icone = Icons.terrain_outlined;
    }
    if (pokemon.type == 'Ice') {
      icone = Icons.snowing;
    }
    if (pokemon.type == 'Flying') {
      icone = CupertinoIcons.wind;
    }
    if (pokemon.type == 'Dark') {
      icone = Icons.brightness_2_sharp;
    }
    if (pokemon.type == 'Ghost') {
      icone = Icons.nights_stay_sharp;
    }
    if (pokemon.type == 'Steel') {
      icone = Icons.build_sharp;
    }
    if (pokemon.type == 'Fairy') {
      icone = Icons.pets_sharp;
    }
    if (pokemon.type == 'Poison') {
      icone = CupertinoIcons.burn;
    }
    if (pokemon.type == 'Dragon') {
      icone = Icons.catching_pokemon;
    }


    return Icon(icone);
  }
}
