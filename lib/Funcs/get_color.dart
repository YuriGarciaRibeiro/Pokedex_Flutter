

import 'package:flutter/material.dart';


Color getTypeColor(String type) {

  
  if (type == "grass"){
    return Colors.green;
  }
  else if(type == "fire"){
    return Colors.red;
  }
  else if(type == "water"){
    return Colors.blue;
  }
  else if(type == "bug"){
    return Colors.lightGreen;
  }
  else if(type == "normal"){
    return Colors.grey;
  }
  else if(type == "poison"){
    return Colors.purple;
  }
  else if(type == "electric"){
    return Colors.yellow;
  }
  else if(type == "ground"){
    return Colors.brown;
  }
  else if(type == "fairy"){
    return Colors.pink;
  }
  else if(type == "fighting"){
    return Colors.orange;
  }
  else if(type == "psychic"){
    return Colors.pinkAccent;
  }
  else if(type == "rock"){
    return Colors.brown;
  }
  else if(type == "ghost"){
    return Colors.deepPurple;
  }
  else if(type == "ice"){
    return Colors.cyan;
  }
  else if(type == "dragon"){
    return Colors.indigo;
  }
  else if(type == "dark"){
    return Colors.black;
  }
  else if(type == "steel"){
    return Colors.blueGrey;
  }
  else{
    return Colors.white;
  }
}

