import 'package:flutter/material.dart';

import '../Control/RequestPokemon.dart';

class EvolutionLine extends StatefulWidget {
  final String evolutionLineLink;
  const EvolutionLine({Key? key, required this.evolutionLineLink})
      : super(key: key);

  @override
  State<EvolutionLine> createState() => _EvolutionLineState();
}

class _EvolutionLineState extends State<EvolutionLine> {
  late Future<Map> request;

  @override
  void initState() {
    super.initState();
    request = RequestPokemon().getEvolutionChain(widget.evolutionLineLink);
  }

  //funçao para ver quantos pokemons tem na cadeia evolutiva
  List<String> extractUrls(Map<String, dynamic> json) {
    List<String> urls = [];
    urls.add(json["species"]["url"]);
    for (var i = 0; i < json["evolves_to"].length; i++) {
      urls.add(json["evolves_to"][i]["species"]["url"]);
      for (var j = 0; j < json["evolves_to"][i]["evolves_to"].length; j++) {
        urls.add(json["evolves_to"][i]["evolves_to"][j]["species"]["url"]);
      }
    }
    return urls;
  }


  String capitalize(String text) {
            if (text.isEmpty) {
              return text;
            }
            return text[0].toUpperCase() + text.substring(1);
          }



  List<String> extractEvolutionDetails(Map<dynamic, dynamic> json) {
    List<String> details = [];

    void findDetails(Map<String, dynamic> evolvesTo) {
      if (evolvesTo['evolution_details'] != null &&
          evolvesTo['evolution_details'].isNotEmpty) {
        var detail = evolvesTo['evolution_details'][0];
        if (detail['min_level'] != null) {
          details.add("Lv: ${detail['min_level']}");
        } else if (detail['item'] != null) {
          details.add(detail['item']['name']);
        }
      }
      if (evolvesTo['evolves_to'] != null &&
          evolvesTo['evolves_to'].isNotEmpty) {
        findDetails(evolvesTo['evolves_to'][0]);
      }
    }

    if (json['chain']['evolves_to'] != null &&
        json['chain']['evolves_to'].isNotEmpty) {
      findDetails(json['chain']['evolves_to'][0]);
    }

    return details;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: request,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var links = extractUrls(snapshot.data!["chain"]);

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < links.length; i++)
                    FutureBuilder<Map>(
                      future: RequestPokemon().getPokemonByNunber(
                          int.parse(links[i].toString().split("/")[6])),
                      builder: (context, snapshot2) {
                        if (snapshot2.hasData) {
                          var pokemon = snapshot2.data!;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: Image.network(
                                      pokemon["sprites"]["other"]
                                                  ["official-artwork"]
                                              ["front_default"]
                                          .toString(),
                                    ),
                                  ),
                                  Text(
                                    capitalize(pokemon["name"]).toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              //se nao for o ultimo pokemon da cadeia evolutiva entao coloca a seta de evoluçao com o nivel de evoluçao
                              if (i != links.length - 1)
                                Column(
                                  children: [
                                    const Icon(Icons.arrow_forward),
                                    Text(
                                      extractEvolutionDetails(snapshot.data!)[i],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          );
                        } else {
                          return const SizedBox(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    ),
                ],
              ),
            );
          } else {
            return const SizedBox(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
