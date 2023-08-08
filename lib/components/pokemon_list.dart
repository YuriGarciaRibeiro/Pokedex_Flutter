
import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_card.dart';
import 'package:pokedex/Control/RequestPokemon.dart';









class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  late Future<Map> request;



  @override
  void initState() {
    super.initState();
    request = RequestPokemon().getPokemons(RequestPokemon().baseUrl);
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
                        ],
                      );
              }
              else{
                return const SizedBox(child: Center(child: CircularProgressIndicator()),);
              }
            }
    );
  }
}
