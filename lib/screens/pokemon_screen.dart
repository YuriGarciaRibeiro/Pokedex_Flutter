import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class PokemonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pokemon selectPokemon = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(selectPokemon.name),
        ),
        body: Row(
          children: <Widget>[
            Column(children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    selectPokemon.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    selectPokemon.id.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(selectPokemon.type),
            ])
          ],
        ));
  }
}
