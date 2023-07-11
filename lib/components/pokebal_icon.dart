import 'package:flutter/material.dart';
import 'dart:math' as math;

class PokeballIcon extends StatelessWidget {
  const PokeballIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 180 * math.pi / 180,
      child: const Icon(
        Icons.catching_pokemon,
        color: Colors.white,
      ),
    );
  }
}
