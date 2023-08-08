import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Control/RequestPokemon.dart';
import 'package:pokedex/Funcs/get_color.dart';
import '../components/evolution_line.dart';
import '../components/pokemon_card_detail_screen.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  late Future<Map<String, dynamic>> request;

  @override
  void initState() {
    super.initState();
  }

  String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String selectPokemon =
        ModalRoute.of(context)!.settings.arguments as String;
    int pokemonNumber = int.parse(selectPokemon);
    request = fetchCombinedData(pokemonNumber);
  }

  Future<Map<String, dynamic>> fetchCombinedData(int pokemonNumber) async {
    var request1 = await RequestPokemon().getPokemonByNunber(pokemonNumber);
    var request2 = await RequestPokemon().getSpecies(
      "https://pokeapi.co/api/v2/pokemon-species/$pokemonNumber",
    );

    //resquete para pegar o pokemon anterior da cadeia evolutiva

    return {
      'pokemon': request1,
      'species': request2,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: request,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var pokemonData = snapshot.data!['pokemon'];
          var speciesData = snapshot.data!['species'];

          Color color = getTypeColor(pokemonData["types"][0]["type"]["name"]);

          divider() {
            return Divider(
              height: 50,
              color: color,
              endIndent: 30,
              indent: 30,
              thickness: 2,
            );
          }

          id() {
            if (pokemonData["id"].toString().length == 1) {
              return "00${pokemonData["id"]}";
            } else if (pokemonData["id"].toString().length == 2) {
              return "0${pokemonData["id"]}";
            } else {
              return pokemonData["id"].toString();
            }
          }

          String capitalize(String text) {
            if (text.isEmpty) {
              return text;
            }
            return text[0].toUpperCase() + text.substring(1);
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: color,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    pokemonData["name"].toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "RobotoCondensed",
                    ),
                  ),
                ],
              ),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: AutoSizeText(
                        "${capitalize(pokemonData["name"])} #${id()}",
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 60,
                          fontFamily: "RobotoCondensed",
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    PokemonCard(
                      imagen: pokemonData["sprites"]["other"]
                          ["official-artwork"]["front_default"],
                      type: pokemonData["types"].length > 1
                          ? "${capitalize(pokemonData["types"][0]["type"]["name"])} | ${capitalize(pokemonData["types"][1]["type"]["name"])}"
                          : capitalize(pokemonData["types"][0]["type"]["name"])
                              .toString(),
                      cor:
                          getTypeColor(pokemonData["types"][0]["type"]["name"]),
                      titulo: speciesData["genera"][7]["genus"].toString(),
                    ),
                    divider(),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: AutoSizeText(
                        "Description: ",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "RobotoCondensed",
                          fontWeight: FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 00.0, vertical: 10.0),
                      child: AutoSizeText(
                        speciesData["flavor_text_entries"][0]["flavor_text"]
                            .toString()
                            .replaceAll("\n", " "),
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "RobotoCondensed",
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    divider(),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: AutoSizeText(
                        "Evolution Line: ",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "RobotoCondensed",
                          fontWeight: FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ),

                    EvolutionLine(
                      evolutionLineLink:
                          speciesData["evolution_chain"]["url"].toString(),
                    ),
                    divider(),
                    //gallery
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                      child: AutoSizeText(
                        "Gallery: ",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "RobotoCondensed",
                          fontWeight: FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              pokemonData["sprites"]["other"]
                                  ["official-artwork"]["front_default"],
                              height: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              pokemonData["sprites"]["other"]
                                  ["official-artwork"]["front_shiny"],
                              height: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              pokemonData["sprites"]["front_default"],
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              pokemonData["sprites"]["front_shiny"],
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
