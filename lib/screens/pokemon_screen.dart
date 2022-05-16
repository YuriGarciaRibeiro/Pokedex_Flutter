import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';
import '../components/status_chart.dart';

class PokemonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pokemon selectPokemon = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: selectPokemon.color,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(selectPokemon.name),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(selectPokemon.image),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${selectPokemon.name}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      'Type: ${selectPokemon.type2 == '' ? selectPokemon.type : selectPokemon.type + ' | ' + selectPokemon.type2}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      'Generation: ${selectPokemon.generation}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Status',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    StatusChart(selectPokemon: selectPokemon),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
