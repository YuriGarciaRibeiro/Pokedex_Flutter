import 'package:flutter/material.dart';
import 'package:pokedex/Funcs/icons_picker.dart';
import 'package:pokedex/utils/routes/routes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pokedex/Control/RequestPokemon.dart';
import 'package:pokedex/components/pokebal_icon.dart';
import 'package:pokedex/Funcs/get_color.dart';

import '../models/pokemon_model.dart';

class PokemonCard extends StatefulWidget {
  final int index;

  const PokemonCard({Key? key, required this.index}) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  _selectPokemon(BuildContext context) {
    Navigator.of(context).pushNamed(ROUTES.POKEMON_SCREEN,
        arguments: (widget.index + 1).toString());
  }

  late Future<Map> request;
  Color color = Colors.red;

  @override
  void initState() {
    super.initState();
    request = RequestPokemon().getPokemonByNunber(widget.index + 1);

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: request,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InkWell(
              onTap: () => _selectPokemon(context),
              borderRadius: BorderRadius.circular(10),
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: Card(
                        elevation: 5,
                        color: getTypeColor(snapshot.data!["types"][0]["type"]["name"]),
                        child: GridTile(
                          footer: GridTileBar(
                            backgroundColor: Colors.black54,
                            title: AutoSizeText(
                              snapshot.data!["name"].toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 1,
                                fontFamily: "RobotoCondensed",
                              ),
                            ),
                            subtitle: AutoSizeText(
                              snapshot.data!["types"].length > 1
                                  ? "${snapshot.data!["types"][0]["type"]["name"]} | ${snapshot.data!["types"][1]["type"]["name"]}"
                                  : snapshot.data!["types"][0]["type"]["name"]
                                  .toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: "RobotoCondensed",
                              ),
                            ),
                            trailing:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: getIcon(snapshot.data!["types"][0]["type"]["name"]),
                            ),
                          ),
                          child: Image.network(
                            snapshot.data!["sprites"]["other"]["official-artwork"]
                            ["front_default"]
                                .toString(),
                          ),
                        ),
                       ));
                } else {
            return const CircularProgressIndicator();
          } 
        });
  }
}