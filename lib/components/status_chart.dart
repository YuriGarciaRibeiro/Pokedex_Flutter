import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'bar_chart.dart';

class StatusChart extends StatelessWidget {
  final Pokemon selectPokemon;

  StatusChart({this.selectPokemon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: BarChartSample3(selectPokemon: selectPokemon,),
    );
  }
}
