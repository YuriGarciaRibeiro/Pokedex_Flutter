import 'package:flutter/material.dart';

class PokemonCard extends StatefulWidget {
  final String imagen;
  final String type;
  final Color cor;
  final String titulo;

  const PokemonCard({
    Key? key,
    required this.imagen,
    required this.type,
    required this.cor,
    required this.titulo,
  }) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {


  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: ShapeDecoration(
        color: widget.cor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 0.8,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                  widget.imagen,
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      (widget.type),
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "RobotoCondensed",
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  //espaçar os textos
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.titulo,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "RobotoCondensed",
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
