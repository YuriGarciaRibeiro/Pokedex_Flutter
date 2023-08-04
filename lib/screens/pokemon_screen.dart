import 'package:flutter/material.dart';
import 'package:pokedex/Control/RequestPokemon.dart';
import 'package:pokedex/components/PersonDrawer.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {

  late Future<Map> request;

  @override
  Widget build(BuildContext context) {
    final String selectPokemon = ModalRoute.of(context)!.settings.arguments as String;

    setState(() {
      request = RequestPokemon().getPokemonByNunber(int.parse(selectPokemon));
    });

    return FutureBuilder<Map>(
      future: request,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    snapshot.data!["name"].toString(),
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

                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              snapshot.data!["sprites"]["other"]["official-artwork"]["front_default"].toString(),
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Height: ${snapshot.data!["name"]}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                snapshot.data!["types"].length > 1
                                    ? "Type: ${snapshot.data!["types"][0]["type"]["name"]} | ${snapshot.data!["types"][1]["type"]["name"]}" :
                                "Type: ${snapshot.data!["types"][0]["type"]["name"]}",
                              style: const TextStyle(fontSize: 20),
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

        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        },
    );
  }
}
