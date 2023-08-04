import 'package:flutter/material.dart';

Icon getIcon(String type){
  if(type == "grass"){
    return const Icon(Icons.grass_sharp);
  }
  else if(type == "fire"){
    return const Icon(Icons.whatshot_sharp);
  }
  else if(type == "water"){
    return const Icon(Icons.water_drop_sharp);
  }
  else if(type == "bug"){
    return const Icon(Icons.bug_report_sharp);
  }
  else if(type == "normal"){
    return const Icon(Icons.person_outline);
  }
  else if(type == "poison"){
    return const Icon(Icons.emoji_nature_sharp);
  }
  else if(type == "electric"){
    return const Icon(Icons.flash_on_sharp);
  }
  else if(type == "ground"){
    return const Icon(Icons.terrain_sharp);
  }
  else if(type == "fairy"){
    return const Icon(Icons.pets_sharp);
  }
  else if(type == "fighting"){
    return const Icon(Icons.fitness_center_sharp);
  }
  else if(type == "psychic"){
    return const Icon(Icons.catching_pokemon_sharp);
  }
  else if(type == "rock"){
    return const Icon(Icons.terrain_outlined);
  }
  else if(type == "ghost"){
    return const Icon(Icons.nights_stay_sharp);
  }
  else if(type == "ice"){
    return const Icon(Icons.snowing);
  }
  else if(type == "dragon"){
    return const Icon(Icons.catching_pokemon);
  }
  else if(type == "dark"){
    return const Icon(Icons.brightness_2_sharp);
  }
  else if(type == "steel"){
    return const Icon(Icons.build_sharp);
  }else{
    return const Icon(Icons.error);
  }
}