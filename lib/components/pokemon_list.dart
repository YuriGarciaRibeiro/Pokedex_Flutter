import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/data/Pokemons.dart';
import 'package:pokedex/Control/RequestPokemon.dart';

class PokemonList extends StatefulWidget {
  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  late Future<Map> request;



  @override
  void initState() {
    super.initState();
    request = RequestPokemon().getPokemons(RequestPokemon().baseUrl);
    print(RequestPokemon().baseUrl);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
            future: request,
            builder: (context,snapshot){
              if(snapshot.hasData){
                return
                      Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemCount: snapshot.data!["results"].length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (ctx, index) {
                                return PokemonCard(
                                  index: index,
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    RequestPokemon().getPokemons(snapshot.data!["previous"]);
                                    print(snapshot.data!["previous"]);
                                  });
                                },
                                icon: const Icon(Icons.arrow_back_ios),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    RequestPokemon().getPokemons(snapshot.data!["next"]);
                                  });
                                },
                                icon: const Icon(Icons.arrow_forward_ios),
                              ),
                            ],

                          ),
                        ],
                      );
              }
              else{
                return Center(child: CircularProgressIndicator());
              }
            }
    );
  }
}
